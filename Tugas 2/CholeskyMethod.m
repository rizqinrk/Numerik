function x = CholeskyMethod(A,b)
    [L, U] = CholeskyFactor(A);
    % U = Transpose(L)
    n = size(A,1);
    % n = 3
    y = zeros(n,1);
    % y = [0;0;0]
    y(1) = b(1)/L(1);
    % y1 = -3 / 1 = -3
    for i = 2:n, % Loop 2 - 3
        y(i) = (b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
        % Loop ke-2 (i=2)
        % y2 = (33 - 1 * -3) / 3
        % y2 = 12
        % Loop ke-3 (i=3)
        % y3 = (78 - [-2,2] * [-3;12]) / 4
        % y3 = (78 - 30) / 4
        % y3 = 48 / 4
        % y3 = 12
        disp(y);
    end
    x = zeros(n,1);
    % n = 3
    % x = [0;0;0]
    x(n) = y(n)/U(n,n);
    % x3 = 12 / 4
    % x3 = 3
    for i = n-1:-1:1,
        x(i) = (y(i)-U(i,i+1:n)*x(i+1:n))/U(i,i);
        % Loop i = 2
        % x2 = (12 - 2 * 3) / 3
        % x2 = 6 / 3
        % x2 = 2
        % Loop i = 1
        % x1 = (-3 - ([1,-2] * [2;3])) / 1
        % x1 = 1 / 1
        % x1 = 1
    end
end