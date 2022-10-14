#%%
import os
import numpy as np
import matplotlib.pyplot as plt

from magtense import magstatics
from magtense.utils.eval import get_norm_magnetic_flux, load_COMSOL_eval, add_subplot


def main():
    # Define spherical tiles
    tile_val = magstatics.Tiles(1)

    # Define tile as spheroid
    tile_val.tile_type = 7
    tile_val.size = [0.5, 2, 0.5]
    tile_val.offset = [0.1, 0.3, 0.45]
    tile_val.M_rem = (1.2 / (4*np.pi*1e-7))
    tile_val.u_ea = [0, 1, 0]
    tile_val.rot = ([-2, 1, 2], 0)

    # Config for oblate spheroid
    # tile_val.size = [2, 2, 0.5]

    # Plot geometry
    # create_plot(tile_val)

    eval_offset = [0.3, 0.45, 0.2]
    model_offset = [1, 0.75, 1]

    # Load reference points from COMSOL calculation
    COMSOL_eval_path = os.path.dirname(os.path.abspath(__file__)) \
        + '/../../../documentation/examples_FEM_validation/Validation_spheroid/'

    (eval_points_x, H_norm_x_COMSOL) = load_COMSOL_eval('py_Validation_spheroid_prolate_normH_x.txt', \
        eval_offset, COMSOL_eval_path, model_offset=model_offset, unit='T')
    (eval_points_y, H_norm_y_COMSOL) = load_COMSOL_eval('py_Validation_spheroid_prolate_normH_y.txt', \
        eval_offset, COMSOL_eval_path, model_offset=model_offset, unit='T')
    (eval_points_z, H_norm_z_COMSOL) = load_COMSOL_eval('py_Validation_spheroid_prolate_normH_z.txt', \
        eval_offset, COMSOL_eval_path, model_offset=model_offset, unit='T')

    # x-axis
    (_, H_x) = magstatics.run_simulation(tile_val, eval_points_x)
    H_norm_x_MagTense  = get_norm_magnetic_flux(H_x)
    
    # y-axis
    (_, H_y) = magstatics.run_simulation(tile_val, eval_points_y)
    H_norm_y_MagTense  = get_norm_magnetic_flux(H_y)

    # z-axis
    (_, H_z) = magstatics.run_simulation(tile_val, eval_points_z)
    H_norm_z_MagTense  = get_norm_magnetic_flux(H_z)
    
    fig, ax = plt.subplots(1,3)
    fig.suptitle("SPHEROID - MagTensePython vs. COMSOL")
    add_subplot(ax[0], eval_points_x[:,0], 'x_axis', H_norm_x_MagTense, H_norm_x_COMSOL)
    add_subplot(ax[1], eval_points_y[:,1], 'y_axis', H_norm_y_MagTense, H_norm_y_COMSOL)
    add_subplot(ax[2], eval_points_z[:,2], 'z_axis', H_norm_z_MagTense, H_norm_z_COMSOL)
    plt.show()


if __name__ == '__main__':
    main()

# %%
