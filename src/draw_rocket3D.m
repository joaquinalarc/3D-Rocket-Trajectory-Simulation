function draw_rocket3D(radius, height, nose_height, nose_shape)

    figure;
    hold on;
    axis equal;
    xlabel('X (m)');
    ylabel('Y (m)');
    zlabel('Z (m)');
    title('3D Model of the Rocket');
    grid on;

    [Xc, Yc, Zc] = cylinder(radius,50);
    Zc = Zc * height;
    surf(Xc, Yc, Zc, 'FaceColor', [0.8, 0.8, 0.8], 'EdgeColor','none');

    switch lower(nose_shape)
        case "conical"
        [Xn, Yn, Zn] = cylinder([radius, 0], 50);
        Zn = Zn * nose_height + height;

        case "hemispherical"
        [Xs, Ys, Zs] = sphere(50);
        Xn = Xs(26:end,:) * radius;
        Yn = Ys(26:end,:) * radius;
        Zn = Zs(26:end,:) * nose_height + height;

        case "parabolic"
        z_profile = linspace(0, nose_height, 50);
        r_profile = radius * sqrt(1 - (1 - z_profile / nose_height).^2);
        [Z, theta] = meshgrid(z_profile, linspace(0, 2*pi, 50));
        R = radius * sqrt(1 - (1 - Z / nose_height).^2);

        Xn = R .* cos(theta);
        Yn = R .* sin(theta);
        Zn = height + nose_height - Z; 

        case "ogive"
        theta = linspace(0, pi/2, 50);
        r_profile = radius * sin(theta);
        z_profile = nose_height * (1 - cos(theta));
        [Z, T] = meshgrid(z_profile, linspace(0, 2*pi, 50));
        R = radius * sin(pi * Z / nose_height);

        Xn = R .* cos(T);
        Yn = R .* sin(T);
        Zn = height + nose_height/2 - Z;

        otherwise 
            [Xn, Yn, Zn] = cylinder([radius, 0], 50);
            Zn = Zn * nose_height + height;
    end

    surf(Xn, Yn, Zn, 'FaceColor', [0.6, 0.6, 0.6], 'EdgeColor', 'none');

    fin_length = 1 * radius;
    fin_width = 0.25 * height;
    fin_offset = 0.25 * height;

    fill3([radius, radius + fin_length, radius], [0, 0, 0], [0, 0, fin_offset], 'r');
    fill3([-radius, -radius - fin_length, -radius], [0, 0, 0], [0, 0, fin_offset], 'r');
    fill3([0, 0, 0], [radius, radius + fin_length, radius], [0, 0, fin_width], 'r');
    fill3([0, 0, 0], [-radius, -radius - fin_length, -radius], [0, 0, fin_width], 'r');

    view(3);
    camlight;
    lighting gouraud;
    hold off;
end