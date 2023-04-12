function [E_out] = my_mex(P1, P2)

    coder.cinclude('include/npt_pose.h');

    %#codegen
    E_out = zeros(9,1); 
    C_out = zeros(81,1);
    n_obs = numel(P1) / 3;
    % the input numel(P1) is converted to integer type 
    % to match the cAdd function signature
    coder.ceval('npt_pose', coder.rref(P1), coder.rref(P2), coder.wref(C_out), int32(n_obs), coder.wref(E_out));

    % void npt_pose(double* P1, double* P2, double* C, int n_obs, Eigen::Matrix<double, 12, 12>& X_sol, Eigen::Matrix3d& E, bool is_normalize)
    % npt_pose_my(double* P1, double* P2, double* C, int n_obs, double* E)

end