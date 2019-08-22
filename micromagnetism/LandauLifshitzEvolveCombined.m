function [SigmaSol,Applied_field,VV] = LandauLifshitzEvolveCombined(ProblemSetupStruct,InteractionMatrices,Sigma)

% SigmaX = Sigma(1,1,:);
% SigmaY = Sigma(1,2,:);
% SigmaZ = Sigma(1,3,:);

%--- alpha and gamma are native functions in Matlab and must be initialized as variables
alpha = 0;
gamma = 0;

% close all

%% Evaluate all variables in the ProblemSetupStruct
names = fieldnames(ProblemSetupStruct);
for i=1:length(names)
    eval([names{i} '=ProblemSetupStruct.' names{i} ';']);
end

%% Unfold the struct (NB: *after* unfolding ProblemSetupStruct)
DemagTensor = InteractionMatrices.DemagTensor;
N = InteractionMatrices.N;
dx = InteractionMatrices.dx;
dy = InteractionMatrices.dy;
dz = InteractionMatrices.dz;
X = InteractionMatrices.X;
Y = InteractionMatrices.Y;
Z = InteractionMatrices.Z;
A2 = InteractionMatrices.A2;
Kxx = InteractionMatrices.Kxx;
Kxy = InteractionMatrices.Kxy;
Kxz = InteractionMatrices.Kxz;
Kyx = InteractionMatrices.Kyx;
Kyy = InteractionMatrices.Kyy;
Kyz = InteractionMatrices.Kyz;
Kzx = InteractionMatrices.Kzx;
Kzy = InteractionMatrices.Kzy;
Kzz = InteractionMatrices.Kzz;
AvrgMatrix = InteractionMatrices.AvrgMatrix;
CopyMatrix = InteractionMatrices.CopyMatrix;

if SaveGif
    if ~exist('GifFilename','var') 
%     if exist('PreSetFileName','var')
        GifFilename = [ThisPreSetFileName(1:end-4),'.gif'] ;
%     else
%         GifFilename = 'ThisTest01.gif'; % Specify the output file name
%     end
    end
end

%% Effective field parameter prefactors
Jfact = A0/(MU0*Ms) ;   % "J" : exchange term
Hfact = 1/MU0 ;         % "H" : external field term (b.c. user input is in Tesla)
Mfact = Ms ;            % "M" : demagnetization term
Kfact = K0/(MU0*Ms) ;   % "K" : anisotropy term

%% All Interaction Terms (function handles)

O = ones(prod(N),1) ;

% "J" : Effective field : exchange

AA.HjX = @(Sx,Sy,Sz,t) - (2*Jfact).*(A2*Sx) ;
AA.HjY = @(Sx,Sy,Sz,t) - (2*Jfact).*(A2*Sy) ;
AA.HjZ = @(Sx,Sy,Sz,t) - (2*Jfact).*(A2*Sz) ;

% "M" : Effective field : demagnetization (fine grid terms)

AA.HmX = @(Sx,Sy,Sz,t) - Mfact.*(DemagTensor.KglobXX{1}*Sx+DemagTensor.KglobXY{1}*Sy+DemagTensor.KglobXZ{1}*Sz) ;
AA.HmY = @(Sx,Sy,Sz,t) - Mfact.*(DemagTensor.KglobYX{1}*Sx+DemagTensor.KglobYY{1}*Sy+DemagTensor.KglobYZ{1}*Sz) ;
AA.HmZ = @(Sx,Sy,Sz,t) - Mfact.*(DemagTensor.KglobZX{1}*Sx+DemagTensor.KglobZY{1}*Sy+DemagTensor.KglobZZ{1}*Sz) ;

% "H" : Effective field : external field

if UseExplicitSolver | UseDynamicSolver
    AA.HhX = @(Sx,Sy,Sz,t) + (Hfact*HsX(t)).*O ;
    AA.HhY = @(Sx,Sy,Sz,t) + (Hfact*HsY(t)).*O ;
    AA.HhZ = @(Sx,Sy,Sz,t) + (Hfact*HsZ(t)).*O ;
end

if UseImplicitSolver
    AA.HhX = @(Sx,Sy,Sz,t) + (Hfact*ddHsX*(t)).*O ;
    AA.HhY = @(Sx,Sy,Sz,t) + (Hfact*ddHsY*(t)).*O ;
    AA.HhZ = @(Sx,Sy,Sz,t) + (Hfact*ddHsZ*(t)).*O ;

    %
    
    AA.ddHhX = @(Sx,Sy,Sz,t) + (Hfact*ddHsX).*O +0.*t ;
    AA.ddHhY = @(Sx,Sy,Sz,t) + (Hfact*ddHsY).*O +0.*t ;
    AA.ddHhZ = @(Sx,Sy,Sz,t) + (Hfact*ddHsZ).*O +0.*t ;
end

% "K" : Effective field : anisotropy

AA.HkX = @(Sx,Sy,Sz,t) - (2*Kfact).*((Kxx).*Sx + (Kxy).*Sy + (Kxz).*Sz) ;
AA.HkY = @(Sx,Sy,Sz,t) - (2*Kfact).*((Kyx).*Sx + (Kyy).*Sy + (Kyz).*Sz) ;
AA.HkZ = @(Sx,Sy,Sz,t) - (2*Kfact).*((Kzx).*Sx + (Kzy).*Sy + (Kzz).*Sz) ;

% Energies (these variables don't have any effects on the computation: they are just for plotting)

AA.Gj = @(Sx,Sy,Sz,Hx,Hy,Hz) (1/2)*(Sx.'*Hx + Sy.'*Hy + Sz.'*Hz) ; % -(J)*(Sx.'*A2*Sx + Sy.'*A2*Sy)  ;
AA.Gh = @(Sx,Sy,Sz,Hx,Hy,Hz)     + (Sx.'*Hx + Sy.'*Hy + Sz.'*Hz) ;
AA.Gm = @(Sx,Sy,Sz,Hx,Hy,Hz) (1/2)*(Sx.'*Hx + Sy.'*Hy + Sz.'*Hz) - 1 ; % MU.*(Sx.'*HHx(Sx,Sy) + Sy.'*HHy(Sx,Sy)) - 1  ;
AA.Gk = @(Sx,Sy,Sz,Hx,Hy,Hz) (1/2)*(Sx.'*Hx + Sy.'*Hy + Sz.'*Hz) ;

%% Hessian
if UseImplicitSolver | CalcEigenvalue
    NN = size(DemagTensor.KglobXX{1},1) ;
    HessGXX = - (2*Jfact).*(A2) - (Mfact).*DemagTensor.KglobXX{1} - (Kfact).*(Kxx)*eye(NN) ;
    HessGXY =                   - (Mfact).*DemagTensor.KglobXY{1} - (Kfact).*(Kxy)*eye(NN) ;
    HessGXZ =                   - (Mfact).*DemagTensor.KglobXZ{1} - (Kfact).*(Kxz)*eye(NN) ;
    
    HessGYX =                   - (Mfact).*DemagTensor.KglobYX{1} - (Kfact).*(Kyx)*eye(NN) ;
    HessGYY = - (2*Jfact).*(A2) - (Mfact).*DemagTensor.KglobYY{1} - (Kfact).*(Kyy)*eye(NN) ;
    HessGYZ =                   - (Mfact).*DemagTensor.KglobYZ{1} - (Kfact).*(Kyz)*eye(NN) ;
    
    HessGZX =                   - (Mfact).*DemagTensor.KglobZX{1} - (Kfact).*(Kzx)*eye(NN) ;
    HessGZY =                   - (Mfact).*DemagTensor.KglobZY{1} - (Kfact).*(Kzy)*eye(NN) ;
    HessGZZ = - (2*Jfact).*(A2) - (Mfact).*DemagTensor.KglobZZ{1} - (Kfact).*(Kzz)*eye(NN) ;
    
    for k=2:numel(AvrgMatrix)
        
        HessGXX = HessGXX - Mfact.*(CopyMatrix{k}*DemagTensor.KglobXX{k}*AvrgMatrix{k}) ;
        HessGXY = HessGXY - Mfact.*(CopyMatrix{k}*DemagTensor.KglobXY{k}*AvrgMatrix{k}) ;
        HessGXZ = HessGXZ - Mfact.*(CopyMatrix{k}*DemagTensor.KglobXZ{k}*AvrgMatrix{k}) ;
        
        HessGYX = HessGYX - Mfact.*(CopyMatrix{k}*DemagTensor.KglobYX{k}*AvrgMatrix{k}) ;
        HessGYY = HessGYY - Mfact.*(CopyMatrix{k}*DemagTensor.KglobYY{k}*AvrgMatrix{k}) ;
        HessGYZ = HessGYZ - Mfact.*(CopyMatrix{k}*DemagTensor.KglobYZ{k}*AvrgMatrix{k}) ;
        
        HessGZX = HessGZX - Mfact.*(CopyMatrix{k}*DemagTensor.KglobZX{k}*AvrgMatrix{k}) ;
        HessGZY = HessGZY - Mfact.*(CopyMatrix{k}*DemagTensor.KglobZY{k}*AvrgMatrix{k}) ;
        HessGZZ = HessGZZ - Mfact.*(CopyMatrix{k}*DemagTensor.KglobZZ{k}*AvrgMatrix{k}) ;
    end
end

%--- Remark: Whats up with this?
global TheData
InitialData.LastT = 0;
TheData = InitialData;

%% TODO: Decide how to handle plotting
% if UseExplicitSolver
    %--- Remark: Currently does not work. as no arguments are passed to the function    
    PlotStruct = PlotWhileSolving(N,X,Y,Z,Lx,Ly,Lz,Sigma,MaxHx,MaxHy,MaxHz,K0,Kx,Ky,Kz,MU0,DrawIt,DeltaT,SaveGif,GifFilename);
%     if exist('HystDir', 'var')
%         PlotStruct.HystDir = HystDir ;
%     end
% end

%% Define time-derivative function
if UseExplicitSolver | UseDynamicSolver % Still doesn't *quite* work, but tomorrow...
    TheData.dSigmaRMS = inf;    
    TheData.LastPlottedT = 0;
    dSigma2 = @(t,Sigma) CalculateDeltaSigmaManyRanges3D(t,Sigma,N,AvrgMatrix,CopyMatrix,Mfact,DemagTensor,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    % Heff = @(Sigma) CalculateEffectiveFieldManyRanges3D(0,Sigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    % J = NumericalJacobian01(Heff,[SigmaX;SigmaY;SigmaZ],1e-6) ; sum(sum(abs(J-J.')))/sum(sum(abs(J)))
    % dSigmat0 = @(Sigma) dSigma2(0,Sigma)./(repmat(NormOfSigma(Sigma).^3,3,1)) ; J = NumericalJacobian01(dSigmat0,[SigmaX;SigmaY;SigmaZ],1e-6)
    
    if ~exist('HeffLimMagn','var') 
        HeffLimMagn = -inf ;
    end
    ThatOutPutFunct = @(t,y,flag) MyOutputFunction(t,y,flag,HeffLimMagn) ;
%     ThatEventFunct = @(t,y) myEventsFunction(t,y,HsX,HsY,HsZ) ;
end

if UseImplicitSolver
    InitialData.p = 0;
    TheData = InitialData;
end
    % ThisHeffN2 = Heff(NormalizeSigmaCAT(Sigma)) ;
    %--- Remark: Heff is not defined here
%     alpha = @(t) 0.*t+ 1e-9 ;
%--- Remark: CODE FAILS HERE - CalculateEffectiveFieldManyRanges3D has wrong arguments
%     Heff = @(t,Sigma) CalculateEffectiveFieldManyRanges3D(t,Sigma,N,AvrgMatrix,CopyMatrix,Mfact,DemagTensor.KglobXX, ...
%         DemagTensor.KglobXY,DemagTensor.KglobXZ,DemagTensor.KglobYX,DemagTensor.KglobYY,DemagTensor.KglobYZ,DemagTensor.KglobZX, ...
%         DemagTensor.KglobZY,DemagTensor.KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
if UseImplicitSolver | CalcEigenvalue
    Heff = @(t,Sigma) CalculateEffectiveFieldManyRanges3D(t,Sigma,AvrgMatrix,CopyMatrix,Mfact,DemagTensor,AA) ;

%     HHess = @(t,Sigma) CalculateHessianMatrixOfH(Heff(t,NormalizeSigmaCAT(Sigma)),Sigma,HessGXX,HessGXY,HessGXZ,HessGYX,HessGYY,HessGYZ,HessGZX,HessGZY,HessGZZ) ;
    HHess = @(t,Sigma) CalculateMemoryEfficientHessianMatrixOfH(Heff(t,NormalizeSigmaCAT(Sigma)),Sigma,HessGXX,HessGXY,HessGXZ,HessGYX,HessGYY,HessGYZ,HessGZX,HessGZY,HessGZZ) ;
end

if UseImplicitSolver
    % dSigma2 = @(t,Sigma) CalculateDeltaSigmaManyRanges3D(t,Sigma./NormalizeSigmaCAT(Sigma),N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    % dRes = @(t,Sigma,ddSigma) CalculateDeltaSigmaDirectHaODE(t,Sigma,ddSigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    % dRes2 = @(t,Sigma,ddSigma) CalculateDeltaSigmaDirectHaODEauto(t,Sigma,ddSigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    % dRes3 = @(t,Sigma,ddSigma) CalculateDeltaSigmaDirectHaODEmatrix(t,Sigma,ddSigma,HHess,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
    dSigma3 = @(t,Sigma) CalculateDeltaSigmaEquilibriumExplicitOut(t,Sigma,HHess,AA,MaxComputationalTimePerStep) ;
    % dRes = @(t,Sigma,ddSigma) CalculateDeltaSigmaDirectHaODEautoNorm(t,Sigma,ddSigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;

    ThatOutPutFunct = @(t,y,flag) MyOutputFunctionDirect(t,y,flag) ;
%     ThatEventFunct = @(t,y) myEventsFunctionDirect(t,y) ;
end


%% ODE
UseODEsolver = 1 ;
if UseODEsolver
    disp('Integrating Equation of Motion')
    if UseDynamicSolver
        options = odeset('RelTol',1e-12) ;
        [t,SigmaSol] = ode45(dSigma2,t,Sigma,options);
%         [t,SigmaSol] = ode23(dSigma2,t,Sigma,options);
%         disp([te,ye,ie]);
    end
    if UseExplicitSolver
%         options = odeset('RelTol',1e-12,'OutputFcn',ThatOutPutFunct,'Events',ThatEventFunct) ;
        options = odeset('RelTol',1e-12,'OutputFcn',ThatOutPutFunct) ;
%         [t,SigmaSol,te,ye,ie] = ode45(dSigma2,linspace(0,MaxT,nT),[SigmaX;SigmaY;SigmaZ],options);
%         [t,SigmaSol,te,ye,ie] = ode45(dSigma2,linspace(0,MaxT,nT),Sigma,options);
        [t,SigmaSol] = ode45(dSigma2,linspace(0,MaxT,nT),Sigma,options);
%         disp([te,ye,ie]);
    end
    
    if UseImplicitSolver
        options = odeset('OutputFcn',ThatOutPutFunct,'RelTol',1e-3,'MaxStep',abs(t(1)-t(end))) ; % ,'MaxStep',0.01*abs(t(1)-t(end))) ; % ,'Events',ThatEventFunct) ;
%         [t,SigmaSol] = ode45(dSigma3,t,[SigmaX;SigmaY;SigmaZ],options);
        [t,SigmaSol] = ode45(dSigma3,t,Sigma,options);
    end
    
%     if isfield(PlotStruct,'HystDir')
%         SsX_save = [get(PlotStruct.hL6x,'ydata')] ;
%         HsX_save = [get(PlotStruct.hL6x,'xdata')] ;
% 
%         save([ThisPreSetFileName(1:end-4),'HystLoop.mat'],'SsX_save','HsX_save');
% %         SaveTheLoopHystDir(PlotStruct,PreSetFileName)
% %         PlotStruct.hL6x = line(nan,nan,'linewidth',TheLW,'color','k','parent',PlotStruct.hA2) ;
% %         PlotStruct.hL7x = line(nan,nan,'linewidth',TheLW,'color','k','marker','o','markerfacecolor','w','parent',PlotStruct.hA2) ;
%     else
%         if PlotStruct.MaxHn~=0
%             PlotTheLoop(PlotStruct,GifFilename) ;
%         end
%     end
end

Applied_field = [Hfact*HsX(t), Hfact*HsY(t),Hfact*HsZ(t)+0.*t];
% MaxHn=PlotStruct.MaxHn;
% save([ThisPreSetFileName(1:end-4),'solution'],'N','SigmaSol','Applied_field','MaxHn');

%%
% TheG = @(Sigma) CalculateEnergyManyRanges3D(0,Sigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ; 
% TheH = @(Sigma) TheG(Sigma./(repmat(NormOfSigma(Sigma),3,1))) ;
% ThisHHess = NumericalHessian01(TheH,ThisSigma,1e-6) ; 
% VV = eig(ThisHHess) ;
%%
% dSigmat0 = @(Sigma) dSigma2(0,Sigma) ;
% dSigmat02 = @(Sigma) dSigma2(0,Sigma)./(repmat(NormOfSigma(Sigma).^3,3,1)) ;
% ThisHHess3 = NumericalJacobian01(dSigmat02,ThisSigma,1e-6) ; 
%%

% Sigma = ThisSigma ; 
% alpha = @(t) 0.*t+ 1e-9 ;
% Heff = @(Sigma) CalculateEffectiveFieldManyRanges3D(MaxT,Sigma,N,AvrgMatrix,CopyMatrix,Mfact,KglobXX,KglobXY,KglobXZ,KglobYX,KglobYY,KglobYZ,KglobZX,KglobZY,KglobZZ,alpha,gamma,PlotStruct,AA,dx,dy,dz) ;
% ThisHeffN2 = Heff(NormalizeSigmaCAT(Sigma)) ;
% ThisHHess5 = CalculateHessianMatrixOfH(ThisHeffN2,Sigma,HessGXX,HessGXY,HessGXZ,HessGYX,HessGYY,HessGYZ,HessGZX,HessGZY,HessGZZ) ; 
% 
if CalcEigenvalue
ThisHHess5 = HHess(t(end),SigmaSol(end,:)') ;
VV = CalculateHessianEigenvaluesFromHH(ThisHHess5) ;
if UseImplicitStepsSolver
    if VV(NN+1) < 0
        error('TheEigenvalue has wrong sign') ;
        
    end
end
end
%%
%--- Remark: Check this code.
%--- Counter remark: To be used in StepByStep methods (i.e. explicit
%                    methods) as diagnostics. Not ready yet.
% if UseImplicitSolver
%     alpha = @(t) 0.*t+ 1e-9 ;
%     Heff = @(Sigma) CalculateEffectiveFieldManyRanges3D(MaxT,Sigma,AvrgMatrix,CopyMatrix,Mfact,DemagTensor,AA) ;
% 
% 
%     VV = CalculateHessianEigenvalues(SigmaSol(end,:)',Heff,HessGXX,HessGXY,HessGXZ,HessGYX,HessGYY,HessGYZ,HessGZX,HessGZY,HessGZZ) ;
%     % figure ; plot(real(VV),imag(VV),'o') ; axis equal ; grid on
%     save([ThisPreSetFileName(1:end-4),'Eigs.mat'],'VV') ;
% end
%%
if ~isfinite(PlotStruct.DeltaT)
    try ; delete(hF) ; end
end


% SigmaSol = reshape(SigmaSol(:,:),numel(t), 3, []);

% Globals can be sticky.
clear TheData
end
