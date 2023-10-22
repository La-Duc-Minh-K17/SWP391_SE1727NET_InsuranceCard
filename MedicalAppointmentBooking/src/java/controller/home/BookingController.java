/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.AppointmentDAO;
import dal.PatientDAO;
import dal.ReservationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Appointment;
import model.Doctor;
import model.Patient;
import model.Reservation;
import model.Service;
import model.UserAccount;
import utils.EmailSending;
import utils.SessionUtils;
import utils.TimeUtil;

/**
 *
 * @author Admin
 */
public class BookingController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PatientDAO pDAO = new PatientDAO();
        AppointmentDAO aDAO = new AppointmentDAO();
        ReservationDAO rDAO = new ReservationDAO();
        String action = request.getParameter("action");
        Doctor chosenDoctor = (Doctor) SessionUtils.getInstance().getValue(request, "chosen_doctor");
        Service chosenService = (Service) SessionUtils.getInstance().getValue(request, "chosen_service");
        UserAccount user = (UserAccount) SessionUtils.getInstance().getValue(request, "user");

        if (action != null && action.equals("check_availability")) {
            String date = request.getParameter("date");
            List<String> timeSlot = null;
            if (chosenDoctor != null) {
                timeSlot = aDAO.getAvailableTimeSlot(chosenDoctor.getDoctorId(), date);
            }
            if (chosenService != null) {
                timeSlot = rDAO.getAvailableTimeSlot(chosenService.getService_id(), date);
            }
            request.setAttribute("timeslot", timeSlot);
            request.setAttribute("date", date);

            request.getRequestDispatcher("frontend/view/booking.jsp").forward(request, response);
            return;
        }
        if (action != null && action.equals("yourself-booking")) {
            
            String apptTime = request.getParameter("appt-time");
            String apptDate = request.getParameter("appt-date");
            String apptNote = request.getParameter("appt-reason");
            if (chosenDoctor != null) {
                Patient patient = new Patient(
                        user.getUserId(),
                        user.getUserName(),
                        user.getEmail(),
                        user.getFullName(),
                        user.getGender(),
                        user.getPhone(),
                        user.getImage(),
                        user.getDob(),
                        user.getAddress(),
                        user.getStatus());
                int patientId = pDAO.getPatientId(patient);
                if (patientId == -1) {
                    patientId = pDAO.insertPatient(patient);
                }
                patient.setPatientId(patientId);
                Appointment appt = new Appointment(apptNote, TimeUtil.dateConverter(apptDate), apptTime, "PENDING", chosenDoctor, patient);
                if (aDAO.checkAvailability(appt)) {
                    request.setAttribute("error", "This slot time is fully booked now! Please choose other date and time.");
                    request.getRequestDispatcher("frontend/view/booking.jsp").forward(request, response);
                    return;
                }
                aDAO.insertNewAppointment(appt);
                response.sendRedirect("frontend/view/booking_success.jsp");
                return;
            }
            if (chosenService != null) {
                Patient patient = new Patient(
                        user.getUserId(),
                        user.getUserName(),
                        user.getEmail(),
                        user.getFullName(),
                        user.getGender(),
                        user.getPhone(),
                        user.getImage(),
                        user.getDob(),
                        user.getAddress(),
                        user.getStatus());
                int patientId = pDAO.getPatientId(patient);
                if (patientId == -1) {
                    patientId = pDAO.insertPatient(patient);
                }
                patient.setPatientId(patientId);
                Reservation resv = new Reservation(apptNote, TimeUtil.dateConverter(apptDate), apptTime, "PENDING", chosenService, patient);
                if (rDAO.checkAvailability(resv)) {
                    request.setAttribute("error", "This slot time is fully booked now! Please choose other date and time.");
                    request.getRequestDispatcher("frontend/view/booking.jsp").forward(request, response);
                    return;
                }
                rDAO.insertNewReservation(resv);
                response.sendRedirect("frontend/view/booking_success.jsp");
                return;
            }

        }
        if (action != null && action.equals("form-filling")) {
            request.getRequestDispatcher("frontend/view/booking.jsp").forward(request, response);
            return;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
