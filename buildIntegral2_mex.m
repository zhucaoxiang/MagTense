clear all
mex -LNumericalIntegrationLib\NumericalIntegration\NumericalIntegration\x64\Release\ -lNumericalIntegration ...
    -INumericalIntegrationLib\NumericalIntegration\NumericalIntegration\x64\Release\ ...
    MagStatPrismMEX\MagStatPrismMEX\integral2_mex.f90 ...
    COMPFLAGS5="$COMPFLAGS /MT /extend_source:132 /real_size:64"