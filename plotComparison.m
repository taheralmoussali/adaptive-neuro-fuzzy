function plotComparison(x, out_fis, out_anfis, name_input,name_output, image_filename)
    figure;
    plot(x, out_fis, 'o-', 'DisplayName', 'Fuzzy Logic');
    hold on;
    plot(x, out_anfis, 'x-', 'DisplayName', 'ANFIS');
    legend('show');
    %{
    plot(x, out_fis);
    hold on;
    plot(x, out_anfis);
    legend('Fuzzy Logic', 'ANFIS');
%}
    title('Fuzzy Logic vs. ANFIS Comparison');
    xlabel(name_input);
    ylabel(name_output);

    saveas(gcf, image_filename);
end