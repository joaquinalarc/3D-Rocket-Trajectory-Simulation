# 3D ROCKET TRAJECTORY SIMULATION 🚀

This MATLAB-based project simulates the three-dimensional trajectory of a rocket, accounting for key physical factors such as gravity, air resistance, thrust, variable mass, atmospheric density, the Coriolis effect, and crosswind forces. The goal is to model and visualize realistic rocket motion in a dynamic environment.

---

## 📌 Features

- ✅ 3D trajectory calculation in space (X, Y, Z)
- ✅ Real-time animated visualitation
- ✅ Variable mass due to fuel consumption
- ✅ Atmospheric density variation by altitude
- ✅ Crosswind modeling (speed and direction)
- ✅ Coriolis force based on launch latitude
- ✅ Drag coefficient calculated with Reynolds number
- ✅ Comparative analysis: with vs. without wind

---

## Folder Structure

- `src/`: All MATLAB source files.
- `report/`: The final PDF report and supporting documents.
- `plots/`: Exported figures used for the report or documentation.

---

## 📊 Visual Output

| Trajectory 3D | Wind vs. No Wind | Horizontal Deviation |
|---------------|------------------|------------------------|
| ![Trajectory](plots/rocket_3D_trajectory.png) | ![Compare](plots/3D_Trajectory_(With_and_Without_wind).png) | ![XY](plots/Horizontal_Deviation_Comparison.png) |

---

## 🔧 How to use

1. Clone the repository or download the source files.
2. Open `main.mlx` in MATLAB
3. Run the script. You will be prompted to imput the following parameters:
   - Rocket mass, fuel mass, thrust, diameter, height
   - Launch angles and latitude
   - Wind speed and direction
   - Nose cone shape and fuel type
4. The simulation will compute:
   - 3D Trajectory with aerodynamic effect
   - 3D model of the rocket
   - Velocity and acceleration graph
   - Comparaison between wind and no-wind
   - Real-time rocket animation

All visual outputs are automatically saved in the `images/` folder as PNG files. These include trajectory plots, velocity and acceleration graphs, and wind comparison charts.

---

## 🧠 Physics Behind the Model

The simulation incorporates realistic physics and engineering assumptions based on rocketry principles. Key components include:

---

### 🔹 Net Force Calculation
The total net force acting on the rocket is defined as:

![Net Force Equation](images/Net_Force-No_bg.png)

---
  
### 🔹 Drag Force
Aerodynamic drag is computed using the standard quadratic drag formula:

![Drag Force Equation](images/Drag_Equation-No_bg.png)

Where:
- ρ = air density
- Cd = drag coefficient
- A = frontal area of the rocket
- v = velocity magnitude

---

### 🔹 Atmospheric Density Model:
The simulation uses a two-layer atmosphere:
- **Troposphere (0-11 km):** Temperature lapse rate model.
- **Stratosphere (>11 km):** Isothermal model with exponential decay.

---

### 🔹 Variable Mass
The rocket’s mass decreases over time as fuel burns, defined as:

![Mass Equation](images/m(t).png)

Where \( \dot{m} \) is the mass flow rate derived from thrust and specific impulse:

![Mass Dot Equation](images/mdot.png)

---

### 🔹 Coriolis Force
Due to Earth's rotation, a Coriolis term is added to the dynamics for lateral deflection, especially at non-equatorial latitudes. 

---

## 📁 Files

| File | Description |
| ---- | ----------- |
| `main.xlx` | Live script that runs full simulation and plots |
| `simulate_rocket_3D.m` | Core physics simulation |
| `draw_rocket3D.m` | 3D visualization of the rocket |
| `simulate_and_draw_rocket3D.m` | Animated simulation |
| `compare_wind_effect.m` | Comparative plots (wind vs. no wind) |
| `calculate_Cd0.m` | Drag coefficient calculation |

---

## 🧑‍💻 About me

I'm Joaquin, a freshman at **Purdue University** majoring in Aerospace Engineering. This project was developed to deepen my understanding of rocket dynamics and prepare for research opportunities in propulsion and trajectory modeling 

Feel free to reach out or connect with me on [LinkedIn](https://pe.linkedin.com/in/joaquin-alarcon)

---

## Conclusion & Future Work:

This project succesfully simulates the 3D trajectory of a rocket using a physics-based model in MATLAB, incorporating factors such as variable mass, crosswind, and aerodynamic drag dependent on rocket geometry. The model also includes real-time 3D visualization and comparative analysis under different atmospheric conditions. 

While the simulation yields realistic outputs, further development could include:
- Multi-stage rocket modelling
- Dynamic thrust variation based on engine data
- Integration with real atmospheric models (e.g., NOAA datasets)
- GUI implementation for user-friendly parameter input
- Validation with experimental or published data

This simulation lays the foundation for deeper exploration in aerospace dynamics and software-based propulsion analysis.

---

## 📬 Contact:

- 📧 Email: joaq.alrc@outlook.com
- 🌐 Github : [@joaquinalarc](https://github.com/joaquinalarc)
- 📸 Instagram : [@joa.alarcon_](https://www.instagram.com/joa.alarcon_/)

## 💖 Support:

Liked this project? Help me keep building rockets (and maybe buy some coffee too):

☕ [Donate via Paypal](https://www.paypal.me/joaquix96)
