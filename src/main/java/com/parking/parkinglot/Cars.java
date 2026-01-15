package com.parking.parkinglot;

import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.ejb.CarsBean;
import jakarta.annotation.security.DeclareRoles;
import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
@DeclareRoles({"READ_CARS", "WRITE_CARS"})
@ServletSecurity(
        value = @HttpConstraint(rolesAllowed = {"READ_CARS"}),
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "POST", rolesAllowed = {"WRITE_CARS"})
        }
)
@WebServlet(name = "Cars", value = "/Cars")
public class Cars extends HttpServlet {
    @Inject
    CarsBean carsBean;

    // Total number of parking spots in the lot (adjust as needed)
    private static final int TOTAL_PARKING_SPOTS = 100;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {

//        Principal u = request.getUserPrincipal();
       // WebPrincipal uu = (WebPrincipal)u;
        boolean b = request.isUserInRole("READ_CARS");

        List<CarDto> cars = carsBean.findAllCars();
        request.setAttribute("cars", cars);

        // compute free spots dynamically instead of a hard-coded value
        int freeSpots = TOTAL_PARKING_SPOTS - (cars == null ? 0 : cars.size());
        if (freeSpots < 0) freeSpots = 0;
        request.setAttribute("numberOfFreeParkingSpots", freeSpots);

        request.getRequestDispatcher("/WEB-INF/pages/cars.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String [] carIdsAsString = request.getParameterValues("car_ids");
        if (carIdsAsString != null) {
            List<Long> carIds = new ArrayList<>();
            for (String carIdAsString : carIdsAsString) {
                carIds.add(Long.parseLong(carIdAsString));
            }
            carsBean.deleteCarsByIds(carIds);
        }
        response.sendRedirect(request.getContextPath()+ "/Cars");
    }
}