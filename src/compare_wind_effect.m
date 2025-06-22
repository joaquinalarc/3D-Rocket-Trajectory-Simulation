function compare_wind_effect(trajectory_with_wind, trajectory_no_wind)

x_wind = trajectory_with_wind(:, 1);
y_wind = trajectory_with_wind(:, 2);
z_wind = trajectory_with_wind(:, 3);
t_wind = trajectory_with_wind(:, 4);

x_no_wind = trajectory_no_wind(:, 1);
y_no_wind = trajectory_no_wind(:, 2);
z_no_wind = trajectory_no_wind(:, 3);
t_no_wind = trajectory_no_wind(:, 4);

figure('Name', '3D Trajectory Comparison', 'NumberTitle', 'off');
plot3(x_wind, y_wind, z_wind, 'b', 'LineWidth', 1.5); hold on;
plot3(x_no_wind, y_no_wind, z_no_wind, 'r--', 'LineWidth', 1.5);
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('3D Trajectory (With and Without Wind)');
legend('With Wind', 'Without Wind');
grid on;
view(3);

exportgraphics(gcf, '3D_Trajectory_(With_and_Without_wind).png', 'Resolution', 300);

figure('Name', 'Altitude vs Time Comparison', 'NumberTitle', 'off');
plot(t_wind, z_wind, 'b', 'LineWidth', 1.5); hold on;
plot(t_no_wind, z_no_wind, 'r--', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Altitude (m)');
title('Altitude vs. Time');
legend('With Wind', 'Without Wind');
grid on;

exportgraphics(gcf, 'Altitude_vs_Time_Comparison.png', 'Resolution', 300);

figure('Name', 'Horizontal Deviation Comparison', 'NumberTitle', 'off');
plot(x_wind, y_wind, 'b', 'LineWidth', 1.5); hold on;
plot(x_no_wind, y_no_wind, 'r--', 'LineWidth', 1.5);
xlabel('Position X (m)');
ylabel('Position Y (m)');
title('Horizontal Deviation (X vs. Y)');
legend('With Wind', 'Without Wind');
grid on;

exportgraphics(gcf, 'Horizontal_Deviation_Comparison.png', 'Resolution', 300);
end