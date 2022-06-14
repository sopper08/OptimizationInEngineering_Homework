% �۩w�qø�Ϩ�ơA�e�X�C�����N�����G�C
function state = my_plot(options, state, flag)
    
    % ø�s�Ҧ��I�쪺�A����  
    X = state.Population(:, 1);
    Y = state.Population(:, 2);
    Z =  3*(1-X).^2.*exp(-(X.^2) - (Y+1).^2) ... 
       - 10*(X/5 - X.^3 - Y.^5).*exp(-X.^2-Y.^2) ... 
       - 1/3*exp(-(X+1).^2 - Y.^2);

    % �s�X peaks �ϧ�
    peaks;

    % ��Ҧ��A���ȡAø�s��P�@�i�ϭ��W
    hold on
    plot3(X, Y, Z, 'r.', 'MarkerSize', 10, 'Parent', gca)
    hold off
end