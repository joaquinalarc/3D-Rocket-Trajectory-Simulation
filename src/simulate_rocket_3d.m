function trajectory = simulate_rocket_3d(m_cohete, m_combustible, g, rho0, Cd0, A, thrust, burn_time, dt, theta_z, theta_xy, Isp, nose_shape, diametro, latitud, V_wind, theta_wind)

    R = 287.05;
    L = 0.0065;
    T0 = 288.15;
    T11 = 216.65;
    mu = 1.81e-5;
    c = 340;
    h_tropo = 11000;
    omega = 7.2921e-5;

    rho11 = rho0 * (T11/T0)^(g / (R * L) - 1);

    vx = 0; vy = 0; vz = 0;
    x = 0; y = 0; z = 0;
    t = 0;

    m_total = m_cohete + m_combustible;
    m_dot = thrust/(Isp * g);

    flight_time = ceil(60 / dt);
    max_steps = ceil(flight_time / dt);

    trajectory = zeros(max_steps, 7);
    step = 1;
    
    while z >= 0

        if z <= h_tropo
            T = T0 - L * z;
            rho = rho0 * (T / T0)^(g / (R * L) - 1);
        else
            rho = rho11 * exp(-g * (z - h_tropo) / (R * T11));
        end

        v = sqrt(vx^2 + vy^2 + vz^2);
        Mach = v / c;
        
        Re = (rho * v * diametro) / mu;

        Vwx = V_wind * cosd(theta_wind);
        Vwy = V_wind * sind(theta_wind);

        Fwx = -0.5 * rho * Cd0 * A * (Vwx - vx)^2 * sign(Vwx);
        Fwy = -0.5 * rho * Cd0 * A * (Vwy - vy)^2 * sign(Vwy);

        Fc_x = -2 * m_total * omega * vz * cosd(latitud);
        Fc_y = 2 * m_total * omega * vy * sind(latitud);
        Fc_z = -2 * m_total * omega * (vx * cosd(latitud) - vy * sind(latitud));

        if Mach < 0.8
            Cd = Cd0 * (1 + 0.02 * Mach^2);
        elseif Mach < 1.2
            Cd = Cd0 * (1 + 2 * Mach);
        elseif Mach < 5
            Cd = Cd0 * (1 + 0.4 * Mach);
        else
            Cd = Cd0 * (1 + 0.1 * Mach);
        end

        if t < burn_time

            m_combustible = max(0, m_combustible - m_dot * dt);
            m_total = m_cohete + m_combustible;

            Fxy = thrust * cosd(theta_z);
            Fx = Fxy * cosd(theta_xy);
            Fy = Fxy * sind(theta_xy);
            Fz = thrust * sind(theta_z) - m_total*g;

        else
            Fx = 0;Fy = 0; Fz = -m_total * g;
        end

        if v ~= 0
            Fdrag_x = 0.5 * rho * Cd * A * vx * abs(vx);
            Fdrag_y = 0.5 * rho * Cd * A * vy * abs(vy);
            Fdrag_z = 0.5 * rho * Cd * A * vz * abs(vz);

            ax = (Fx - Fdrag_x + Fc_x + Fwx) / m_total;
            ay = (Fy - Fdrag_y + Fc_y + Fwy) / m_total;
            az = (Fz - Fdrag_z + Fc_z) / m_total;
        else
            ax = Fx / m_total;
            ay = Fy / m_total;
            az = Fz / m_total;
        end

        vx = vx + ax * dt;
        vy = vy + ay * dt;
        vz = vz + az * dt;
        x = x + vx * dt;
        y = y + vy * dt;
        z = z + vz * dt;

        trajectory(step, :) = [x, y, z, t, ax, ay, az];
        step = step + 1;
        t = t + dt;

        if z <= 0 && vz <= 0
            break;
        end
    end
    trajectory = trajectory(1:step-1, :);
end



