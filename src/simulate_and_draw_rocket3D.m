function simulate_and_draw_rocket3D(trajectory, radius, height, nose_height, nose_shape)
figure; 
hold on;
axis equal;
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('Rocket Trajectory Simulation');
grid on;
view(3);

traj_line = animatedline('LineWidth', 2, 'Color', 'b');

draw_rocket3D(radius, height, nose_height, nose_shape);

for i = 1:size(trajectory, 1)
    x = trajectory(i, 1);
    y = trajectory(i, 2);
    z = trajectory(i, 3);

    addpoints(traj_line, x, y, z);
    drawnow;
    pause (0.01);
end 

hold off
end 
