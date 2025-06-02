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

## 📊 Visual Output

| Trajectory 3D | Wind vs. No Wind | Horizontal Deviation |
|---------------|------------------|------------------------|
| ![Trajectory](demo_plots/3d_trajectory.png) | ![Compare](demo_plots/comparison.png) | ![XY](demo_plots/horizontal.png) |

---

## 🧠 Physics Behind the Model

**Forces**:
  \[
  F_{\text{net}} = F_{\text{thrust}} - F_{\text{gravity}} - F_{\text{drag}} + F_{\text{wind}} + F_{\text{coriolis}}
  \]

- **Drag Force**:  
  \[
  F_d = \frac{1}{2} \rho C_d A v^2
  \]
  
