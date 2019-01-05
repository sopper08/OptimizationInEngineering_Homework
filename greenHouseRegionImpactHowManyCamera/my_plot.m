% 自定義繪圖函數，畫出每次迭代的結果。
function state = my_plot(options, state, flag)
    
    % 繪製所有點位的適應值  
    X = state.Population(:, 1);
    Y = state.Population(:, 2);
    Z =  3*(1-X).^2.*exp(-(X.^2) - (Y+1).^2) ... 
       - 10*(X/5 - X.^3 - Y.^5).*exp(-X.^2-Y.^2) ... 
       - 1/3*exp(-(X+1).^2 - Y.^2);

    % 叫出 peaks 圖形
    peaks;

    % 把所有適應值，繪製到同一張圖面上
    hold on
    plot3(X, Y, Z, 'r.', 'MarkerSize', 10, 'Parent', gca)
    hold off
end