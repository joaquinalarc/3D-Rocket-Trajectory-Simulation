function Cd0 = calculate_Cd0(nose_shape, diameter, length, num_fins, alpha, v, rho)
    mu = 1.81e-5;

    Re = (rho * v * diameter) / mu;

    if strcmp(nose_shape, "conical")
        Cd_nose = 0.5 * (diameter / length);
        elseif strcmp(nose_shape, "ogive")
        Cd_nose = 0.2 * (diameter / length)^0.5;
        elseif strcmp(nose_shape, "parabolic")
        Cd_nose = 0.15 * (diameter / length);
        elseif strcmp(nose_shape, "hemispherical")
        Cd_nose = 0.6 * (diameter / length);
    end 

    if Re > 0

        Cd_body = 0.455 / (log10(Re)^2.58);

    else 
        Cd_body = 0.5;

    end

    Cd_fins = num_fins * 0.1 * (1 + 0.15 * alpha^2);

    Cd0 = Cd_nose + Cd_body + Cd_fins;

end


       


