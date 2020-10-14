package uni.stu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import uni.main.model.Login_All_Dto;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDeptDto;
import uni.sta.model.StuDto;
import uni.sta.service.StuInsertService;

@Controller
public class StuInsertController {
   @Autowired
   StuInsertService stu;

   public void setStu(StuInsertService stu) {
      this.stu = stu;
   }

   @ModelAttribute("selectStuDeptList") // 모델데이터searchTypeList 추가
   public List<StuDeptDto> selectStuDeptList() {
      List<StuDeptDto> list = stu.selectStuDeptList();
      return list;
   }

   @RequestMapping(value = "insertstu.do")
   public String insertform(HttpSession session) throws Exception {
      int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
      if (staff_no == 2020300) {
         return "insertStu4";
      }
      return "insertStu3";
   }

   @RequestMapping(value = "memberjoinstu.do") // 관리자가 학생을 등록하는부분
   public String insertStu(MultipartHttpServletRequest request, HttpSession session, StuDto dto,MultipartFile file) throws IOException {
      // 파일업로드
      String report_path = "C:/Users/jj/git/aaaaa/mvc/src/main/webapp/resources/imgFile";
      //String report_path = "d:/upload/";
      String fileName = file.getOriginalFilename();// 업로드한 파일을 mf에 저장
      dto.setStu_path(fileName);
      File f = new File(report_path+fileName);
         try {
            file.transferTo(f);         
         } catch(IllegalStateException e) {
            e.printStackTrace();
         } catch(IOException e) {
            e.printStackTrace();
         } 
         stu.insertStu(dto);
         int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
         if (staff_no == 2020300) {

            return "insertStu4";
         }
         return "insertStu3";

      }

   @GetMapping(value = "insertsta.do")
   public String insertform1() throws Exception {
      return "insertSta4";
   }

   @RequestMapping(value = "memberjoinsta.do")
   public String insertSta(MultipartHttpServletRequest request, HttpSession session) {
      StaffDto dto = new StaffDto();
      dto.setStaff_nm(request.getParameter("staff_nm"));
      dto.setStaff_birth(request.getParameter("staff_birth"));
      dto.setStaff_gen(request.getParameter("staff_gen"));
      dto.setStaff_coun(request.getParameter("staff_coun"));
      dto.setStaff_dept(request.getParameter("staff_dept"));
      dto.setStaff_tel(request.getParameter("staff_tel"));
      dto.setStaff_email(request.getParameter("staff_email"));
      dto.setStaff_zip(request.getParameter("staff_zip"));
      dto.setStaff_address(request.getParameter("staff_address"));

      // 파일업로드
      MultipartFile mf = request.getFile("staff_path");
      String path = request.getSession().getServletContext().getRealPath("/resources/imgFileSta");
      String fileName = mf.getOriginalFilename();
      File uploadFile = new File(path + "//" + fileName);
      try {
         mf.transferTo(uploadFile);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }

      dto.setStaff_path(fileName);
      stu.insertSta(dto);

      return "insertSta4";

   }

   @GetMapping(value = "insertpro.do")
   public String insertform2(HttpSession session) throws Exception {
      int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
      if (staff_no == 2020300) {
         return "insertPro4";
      }
      return "insertPro3";
   }

   @RequestMapping(value = "memberjoinpro.do")
   public String insertPro(MultipartHttpServletRequest request, HttpSession session) {
      ProDto dto = new ProDto();
      dto.setProf_nm(request.getParameter("prof_nm"));
      dto.setProf_birth(request.getParameter("prof_birth"));
      dto.setProf_gen(request.getParameter("prof_gen"));
      dto.setDept_nm(request.getParameter("dept_nm"));
      dto.setProf_coun(request.getParameter("prof_coun"));
      dto.setDept_cd(request.getParameter("dept_cd"));
      dto.setProf_tel(request.getParameter("prof_tel"));
      dto.setProf_email(request.getParameter("prof_email"));
      dto.setProf_zip(request.getParameter("prof_zip"));
      dto.setProf_address(request.getParameter("prof_address"));

      // 파일업로드
      MultipartFile mf = request.getFile("prof_path");
      String path = request.getSession().getServletContext().getRealPath("/resources/imgFilePro");
      String fileName = mf.getOriginalFilename();
      File uploadFile = new File(path + "//" + fileName);
      try {
         mf.transferTo(uploadFile);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }

      dto.setProf_path(fileName);
      stu.insertPro(dto);

      int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
      if (staff_no == 2020300) {
         return "insertPro4";
      }
      return "insertPro3";

   }
}