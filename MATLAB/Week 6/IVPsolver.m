function [t, w, h] = IVPsolver(f, fdash, a, b, alpha, n, method)
    %IVPsolver Initial Value Problem solver
    % [t,w,h] = IVPsolver(f, fdash, a, b, alpha, n, method) solves an IVP
    % using one of three methods as follows:
    % method = 'euler_method', call Euler solver
    % method = 'taylor2', call Second Order Taylor solver
    % method = 'modeuler', call Modified Euler solver
    % The user may pass any value for fdash if method = 'euler_method' or 'modeuler'
    if strcmp(method, 'euler_method') % call euler_method function
        disp('Using Euler''s method')
        [t, w, h] = euler_method(f, a, b, alpha, n);
    elseif strcmp(method, 'taylor2') % call taylor2 function
        disp('Using Second Order Taylor method')
        [t, w, h] = taylor2(f, fdash, a, b, alpha, n);
    elseif strcmp(method, 'modeuler') % call modeuler function
        disp('Using Modified Euler method')
        [t, w, h] = modeuler(f, a, b, alpha, n);
    else % invalid method choice
        error('Invalid method! Please choose ''euler_method'', ''taylor2'', or ''modeuler''')
    end
