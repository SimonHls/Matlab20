function dof1()
    m = integral(@f1, 0, 10);
    m;

    f2 = @(x) 2*sin(3*x);
    m2 = integral(f2, 0, 10);
    m2
end
