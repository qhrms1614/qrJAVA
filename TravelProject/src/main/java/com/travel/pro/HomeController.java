package com.travel.pro;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   @Autowired
   private SqlSession sqlSession;
   private ServletRequest session;
   
   @RequestMapping(value = "/tour", method = RequestMethod.GET)
   public String tour(Model m) {
	   iTravel map=sqlSession.getMapper(iTravel.class);
	   ArrayList<bando> mapget=map.topadr();
	   m.addAttribute("t1",mapget);
      return "tour";
   }
   
   @RequestMapping(value = "/Mypage", method = RequestMethod.GET)
	public String Mypage(HttpServletRequest request,Model m) {
	   
	   HttpSession session = request.getSession();
	   iTravel tr = sqlSession.getMapper(iTravel.class);
      String userid = (String) session.getAttribute("userid");
     
      member t=tr.loadMember(userid);
      m.addAttribute("t",t);
     
      return "Mypage";
	}
   
//	자유게시판 리스트
// 자유게시판 리스트
 @RequestMapping("/Notice")
 public String notice(HttpServletRequest hsr,Model m,N_Criteria cri) {
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    int total=notice.n_getTotal(cri);
    
    pageDTO page=new pageDTO(total,cri);
    ArrayList<NoticeDTO> list=notice.n_List(cri);   
    m.addAttribute("paging",page);
    m.addAttribute("notice",list);      
    
    return "NoticeList";
 }
// 게시글 보는용
 @RequestMapping("/Notice_View")
 public String nView(HttpServletRequest hsr,Model m,N_Criteria cri) {
    int bno=Integer.parseInt(hsr.getParameter("post_code"));
    iTravel notice=sqlSession.getMapper(iTravel.class);
                
    NoticeDTO post=notice.n_content(bno);
    m.addAttribute("post",post);
    m.addAttribute("page",cri);
    return "NoticeView";
 }
 
// 게시글 작성 페이지 이동
 @RequestMapping("/Notice_Write")
 public String nWrite(HttpServletRequest hsr,Model m,N_Criteria cri) {
   m.addAttribute("page",cri);
    return "NoticeWrite";
 }
 
 @RequestMapping("/Notice_Update")
 public String nUpdate(HttpServletRequest hsr,Model m,N_Criteria cri) {
    int bno=Integer.parseInt(hsr.getParameter("post_code"));
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    NoticeDTO post=notice.n_content(bno);
    m.addAttribute("post",post);
    m.addAttribute("content",post.getContent().replace("<br>","\n"));
    m.addAttribute("page",cri);
    return "NoticeWrite";
 }

// 게시글 작성 및 수정
 @RequestMapping(value="/n_Write",produces="text/plain; charset=UTF-8")
 public String notice_Write(HttpServletRequest hsr) { // 글 추가 및 수정
    String s_bno=hsr.getParameter("post_code");
    String title=hsr.getParameter("title");
    String content=hsr.getParameter("content");
    String writer=hsr.getParameter("writer");
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    if(s_bno.equals(null) || s_bno.equals("")) { // insert
       notice.n_Write(title, content.replace("\n","<br>"), writer);
    } else { // update
       int bno=Integer.parseInt(s_bno);
       notice.n_Update(title,content.replace("\n","<br>"),bno);
    }      
    return "redirect:/Notice";
 }
 
// 게시물 삭제
 @RequestMapping("/Notice_Del")
 public String nDelete(HttpServletRequest hsr) { // 글 삭제
    int bno=Integer.parseInt(hsr.getParameter("post_code"));
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    notice.n_delete(bno);
    return "redirect:/Notice";
 }
 
// 댓글 리스트
 @ResponseBody
 @RequestMapping(value="/list_reply",method=RequestMethod.POST,produces="apllication/json;charset=utf-8")
 public String listreply(HttpServletRequest hsr) {
    int bno=Integer.parseInt(hsr.getParameter("bno"));
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    ArrayList<Reply> rlist=notice.r_list(bno);
    JSONArray ja=new JSONArray();
    for(int i=0;i<rlist.size();i++) {
       JSONObject jo=new JSONObject();
       jo.put("rno",rlist.get(i).getRno());
       jo.put("grp",rlist.get(i).getGrp());         
       jo.put("grpl",rlist.get(i).getGrpl());
       jo.put("writer",rlist.get(i).getWriter());
       jo.put("content",rlist.get(i).getContent());
       jo.put("created",rlist.get(i).getCreated());
       jo.put("updated",rlist.get(i).getUpdated());
       ja.add(jo);
    }
 return ja.toString();
 }
 
// 댓글 개수 구하기
 @ResponseBody
 @RequestMapping(value="/rcount",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
 public String rcount(HttpServletRequest hsr) {
    int bno=Integer.parseInt(hsr.getParameter("bno"));
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    String count=Integer.toString(notice.r_count(bno));
    return count;
 }
 
// 댓글 작성
 @ResponseBody
 @RequestMapping(value="/write_reply",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
 public String writereply(HttpServletRequest hsr) {
    int bno=Integer.parseInt(hsr.getParameter("bno"));
    String writer=hsr.getParameter("writer");
    String content=hsr.getParameter("content");
    String sgrp=hsr.getParameter("grp");
    String flag="";
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    if(sgrp.equals(null) || sgrp.equals("")) { // 모댓글 작성
       notice.rm_Write(bno,writer,content);
       int rno=notice.rno_num();
       notice.rm_Update(rno);
       flag="ok";
    } else { // 자식댓글 작성
       int grp=Integer.parseInt(sgrp);
       int grps=notice.max_grps(grp);
       notice.rc_Write(bno, grp, grps, writer, content);
       flag="ok";
    }
 return flag;
 }
 
// 댓글수정
 @ResponseBody
 @RequestMapping(value="/update_reply",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
 public String updatereply(HttpServletRequest hsr) {
    String content=hsr.getParameter("content");
    int rno=Integer.parseInt(hsr.getParameter("rno"));
    iTravel notice=sqlSession.getMapper(iTravel.class);
    notice.r_Update(content,rno);
    return "ok";
 }
 
// 댓글삭제
 @ResponseBody
 @RequestMapping(value="/delete_reply",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
 public String deletereply(HttpServletRequest hsr) {
    String flag="";
    int rno=Integer.parseInt(hsr.getParameter("rno"));
    
    iTravel notice=sqlSession.getMapper(iTravel.class);
    int grp=notice.rno_grp(rno);
    
    if(rno==grp) { // 모댓글
       int max=notice.max_grps(rno)-1;
       
       if(max==1) {
          notice.r_Delete(rno);
          flag="ok";
       } else {
          notice.r_DelUp("삭제된 댓글입니다.", rno);
          flag="ok";
       }
    } else { // 자식댓글
       notice.r_Delete(rno);
       flag="ok";
    }      
    return flag;
 }
   
   
//    씠  씠 썑遺  꽣 뒗  떎瑜     썝 뱾  떞 떦
   
   
//    뿬 뻾 젙蹂 
   

   
//    쉶 썝媛  엯
 @RequestMapping("/register")
 public String goSignon() {
    return "/register";
 }
 @RequestMapping(value="/Signon_check",method=RequestMethod.POST)
 public String doSignon(HttpServletRequest hsr) {
    String username=hsr.getParameter("username");
    String userid=hsr.getParameter("userid");
    String password=hsr.getParameter("password");
    String birthday=hsr.getParameter("birthday");
    String phone=hsr.getParameter("phone");
    
    iTravel travel=sqlSession.getMapper(iTravel.class);
    travel.insertMember(userid, password, username, birthday, phone);
    return "redirect:/Login";
 }
 

 
// 濡쒓렇 씤
 @RequestMapping("/Login")
 public String goLogin() {
    return "/Login";
 }
 
 @RequestMapping(value="/login_check",method=RequestMethod.POST)
 public String doLogin(HttpServletRequest hsr) {
    HttpSession session=hsr.getSession();
    String userid=hsr.getParameter("userid");
    String password=hsr.getParameter("password");
    
//    iTravel travel=sqlSession.getMapper(iTravel.class);
    session.setAttribute("userid", userid);
    session.setAttribute("password", password);
    return "main";

 }
 
 @ResponseBody
 @RequestMapping(value="/user_check", method=RequestMethod.POST)
 public String user_check(HttpServletRequest hsr) {
//    HttpSession session=hsr.getSession();
    String flag="";
    try {
       String userid=hsr.getParameter("userid");
       String password=hsr.getParameter("password");
       
       iTravel travel=sqlSession.getMapper(iTravel.class);
       Member_dto member=travel.usercheck(userid);
       if(!member.getPassword().equals(password)) {
          flag="fail";
       }
    }catch(Exception e){ //  빐 떦  븘 씠 뵒媛  DB 뿉  뾾 뒗 寃쎌슦  깮湲   삤瑜    鍮 
       flag="fail";
    }      
    return flag;
 }
 
 @ResponseBody
 @RequestMapping(value="/id_check", method=RequestMethod.POST)
 public String id_check(HttpServletRequest hsr) {
    String userid=hsr.getParameter("userid");
     iTravel travel=sqlSession.getMapper(iTravel.class);
     String flag="ok";
    int cnt=travel.idcheck(userid);
    System.out.println("count ["+cnt+"]");
    if(cnt>0) {
       flag="fail";
    } else {
     flag="ok";
    }
     return flag;
 }
 
//濡쒓렇 븘 썐
 @RequestMapping(value = "/logout ", method = RequestMethod.GET)
 public String logout(HttpServletRequest hsr) {
    HttpSession session = hsr.getSession();
//    iTravel travel = sqlSession.getMapper(iTravel.class);
    
    session.invalidate();   
    
    return "redirect:/main";
 }
//븘 씠 뵒 鍮꾨 踰덊샇 李얘린    
 @RequestMapping("/find")
 public String gofind() {
    return "/find";
 }
 
//븘 씠 뵒 李얘린
 @ResponseBody
 @RequestMapping(value="/find_id",method=RequestMethod.POST)
 public String find_id(HttpServletRequest hsr) {
    String username=hsr.getParameter("username");
    String phone=hsr.getParameter("phone");
    String flag="";
    
    try {
       iTravel travel=sqlSession.getMapper(iTravel.class);
       flag=travel.find_id(username, phone);
    } catch (Exception e) {//username,phone( 쉶 썝 젙蹂닿 )  뾾 쓣 寃쎌슦  굹 뒗  뿉 윭諛⑹ 
       flag="fail";
    }
    return flag;
 }
 
 @ResponseBody
 @RequestMapping(value="/find_pw",method=RequestMethod.POST)
 public String find_pw(HttpServletRequest hsr) {
    String username=hsr.getParameter("username");
    String phone=hsr.getParameter("phone");
    String userid=hsr.getParameter("userid");
    String flag="";
    
    try {
       iTravel travel=sqlSession.getMapper(iTravel.class);
       flag=travel.find_pw(username, phone,userid);
    } catch (Exception e) {//username,phone( 쉶 썝 젙蹂닿 )  뾾 쓣 寃쎌슦  굹 뒗  뿉 윭諛⑹ 
       flag="fail";
    }
    return flag;
 }
   

      @RequestMapping(value = "/stay", method = RequestMethod.GET)
      public String stay(Locale locale, Model model) {

         return "stay";
      }

      @RequestMapping(value = "/in/travle", produces = "apllication/json;charset=utf-8")
      public String travle(HttpServletRequest hsr, Model m, Criteria cri) {

         iTravel tr = sqlSession.getMapper(iTravel.class);
         int total = tr.t_getTotal(cri);
         System.out.println(" Խù          [" + total + "]");
            pageDTO page = new pageDTO(total, cri);
            System.out.println("startPage [" + page.getStartPage() + "], endPage [" + page.getEndPage() + "]");
            ArrayList<tra> t = tr.selinfo1(cri);
            m.addAttribute("paging", page);
            m.addAttribute("t", t);
         return "tour";
      }

      @RequestMapping(value = "/in1/stay", produces = "apllication/json;charset=utf-8")
      public String stay1(HttpServletRequest hsr, Model m, Criteria cri) {

         iTravel tr = sqlSession.getMapper(iTravel.class);
         int total = tr.t_getTotal1(cri);
         System.out.println(" Խù          [" + total + "]");

             pageDTO page = new pageDTO(total, cri);
             System.out.println("startPage [" + page.getStartPage() + "], endPage [" + page.getEndPage() + "]");
             ArrayList<tra> t = tr.stay(cri);
             m.addAttribute("paging", page);
             m.addAttribute("t", t);
         return "stay";
      }

      @RequestMapping(value = "/view", produces = "apllication/json;charset=utf-8")
      public String view(HttpServletRequest hsr, Model m) {

         return "view";
      }

      @ResponseBody
      @RequestMapping(value = "/insertJjim", produces = "application/text;charset=utf-8",method=RequestMethod.GET)
      public String insertJjim(HttpServletRequest hsr) {
         String retval="";
         String userid=hsr.getParameter("userid");
         int id = Integer.parseInt(hsr.getParameter("id"));
         String loc = hsr.getParameter("loc");
         iTravel tr = sqlSession.getMapper(iTravel.class);
         ArrayList<jjim> jjim1=tr.inJjim(userid);

         retval="ok";
         for(int i=0; i<jjim1.size(); i++) {
            if(jjim1.get(i).getId()==id && jjim1.get(i).getLoc().equals(loc)) {
               retval="fail"; 
               break;
            }
         }
         if(retval.equals("ok")) {
            tr.insertJjim(userid, id, loc);
         }
         return retval;
      }

      @RequestMapping("/jjim")
      public String jjim(Locale locale, Model m,HttpServletRequest hsr) {
         HttpSession session = hsr.getSession();
         iTravel tr = sqlSession.getMapper(iTravel.class);
         String userid=(String) session.getAttribute("userid");
         ArrayList<tra> t = tr.selJjim(userid);
         m.addAttribute("t", t);
         return "jjim";
      }

      @RequestMapping("/deleteJjim")
      public String deleteJjim(HttpServletRequest hsr) {
         int id = Integer.parseInt(hsr.getParameter("id"));
         String loc = hsr.getParameter("loc");
         iTravel tr = sqlSession.getMapper(iTravel.class);
         tr.selDelete(id, loc);

         return "redirect:/jjim";
      }//

      @ResponseBody
      @RequestMapping(value = "/insertJjim1", produces = "application/text;charset=utf-8",method=RequestMethod.GET)
      public String insertJjim1(HttpServletRequest hsr) {
         String retval="";
         String userid=hsr.getParameter("userid");
         int id = Integer.parseInt(hsr.getParameter("id"));
         String loc = hsr.getParameter("loc");
         iTravel tr = sqlSession.getMapper(iTravel.class);
         ArrayList<jjim> jjim1=tr.inJjim1(userid);

         retval="ok";
         for(int i=0; i<jjim1.size(); i++) {
            if(jjim1.get(i).getId()==id && jjim1.get(i).getLoc().equals(loc)) {
               retval="fail"; 
               break;
            }
         }
         if(retval.equals("ok")) {
            tr.insertJjim1(userid, id, loc);
         }
         return retval;
      }

      @RequestMapping("/jjim1")
      public String jjim1(Locale locale, Model m,HttpServletRequest hsr) {
         HttpSession session = hsr.getSession();
         iTravel tr = sqlSession.getMapper(iTravel.class);
         String userid=(String) session.getAttribute("userid");
         ArrayList<tra> t = tr.selJjim1(userid);
         m.addAttribute("t", t);
         return "jjim1";
      }

      @RequestMapping("/deleteJjim1")
      public String deleteJjim1(HttpServletRequest hsr) {
         int id = Integer.parseInt(hsr.getParameter("id"));
         String loc = hsr.getParameter("loc");
         iTravel tr = sqlSession.getMapper(iTravel.class);
         tr.selDelete1(id, loc);

         return "redirect:/jjim1";
      }//
      @RequestMapping("/ji")
      public String ji() {
         return "ji";
      }
     	
     	/* 아이디,비밀번호,이름,생년월일,전화번호 불러오기 */
    	@RequestMapping(value = "/doMypage", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
    	public String doMypage(HttpServletRequest request,Model m) {
    		
    		HttpSession session = request.getSession();
     		iTravel tr = sqlSession.getMapper(iTravel.class);
            String userid = (String) session.getAttribute("userid");
    		
    		member t=tr.loadMember(userid);
     		m.addAttribute("t",t);
    		
    		return "Mypage";
    		
    	}

    	@ResponseBody
    	@RequestMapping(value = "/ChangePW", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    	public String ChangePW(HttpServletRequest hsr) {
    		String retval = "";
    		try {
    			iTravel tr = sqlSession.getMapper(iTravel.class);
    			ArrayList<member> ml = tr.memberinfo();
    			JSONArray ja = new JSONArray();
    			for (int i = 0; i < ml.size(); i++) {
    				JSONObject jo = new JSONObject();
    				jo.put("id", ml.get(i).getUserid());
    				jo.put("pw", ml.get(i).getPassword());
    				ja.add(jo);
    			}

    			retval = ja.toString();
    		} catch (Exception e) {
    			retval = "fail";
    		}
    		return retval;
    	}

    	@ResponseBody
    	@RequestMapping(value = "/ChangePW1", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    	public String ChangePW1(HttpServletRequest hsr, HttpServletRequest request) {
    		String retval1 = "";
    		try {
    			String id = hsr.getParameter("id");
    			String pw = hsr.getParameter("pw");
    			String pw1 = hsr.getParameter("pw1");
    			iTravel tr = sqlSession.getMapper(iTravel.class);
    			tr.ChangePW(id, pw, pw1);
    			retval1 = "ok!";

    		} catch (Exception e) {
    			retval1 = "fail";
    		}
    		return retval1;
    	}

    	@ResponseBody
    	@RequestMapping(value = "/ChangePH", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    	public String ChangePH(HttpServletRequest hsr) {
    		String retval = "";
    		try {
    			iTravel tr = sqlSession.getMapper(iTravel.class);
    			ArrayList<member> ml = tr.memberinfo();
    			JSONArray ja = new JSONArray();
    			for (int i = 0; i < ml.size(); i++) {
    				JSONObject jo = new JSONObject();
    				jo.put("id", ml.get(i).getUserid());
    				jo.put("ph", ml.get(i).getPhone());
    				ja.add(jo);
    			}
    			retval = ja.toString();
    		} catch (Exception e) {
    			retval = "fail";
    		}
    		return retval;
    	}

    	@ResponseBody
    	@RequestMapping(value = "/ChangePH1", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    	public String ChangePH1(HttpServletRequest hsr, HttpServletRequest request) {
    		String retval1 = "";
    		try {
    			String id = hsr.getParameter("id");
    			String ph = hsr.getParameter("ph");
    			String ph1 = hsr.getParameter("ph1");
    			iTravel tr = sqlSession.getMapper(iTravel.class);
    			tr.ChangePH(id, ph, ph1);
    			retval1 = "ok!";
    		} catch (Exception e) {
    			retval1 = "fail";
    		}
    		return retval1;
    	}
    	
    	@RequestMapping(value = "/main", method = RequestMethod.GET)
    	   public String main(Locale locale, Model model) {
    	   
    	      return "main";
    	   }
    	   
    	   @RequestMapping(value="/in",produces = "apllication/json;charset=utf-8")
    	   public String in(HttpServletRequest hsr,Model m) {
    	      String info=hsr.getParameter("st");
    	      System.out.println(info);
    	      iTravel tr=sqlSession.getMapper(iTravel.class);
    	      ArrayList<tra> t=tr.selinfo(info);
    	      m.addAttribute("t",t);
    	      return "home";
    	   }
    	   
    	   @ResponseBody
    	   @RequestMapping(value="/getmap",method=RequestMethod.GET,
    	            produces="application/json;charset=utf-8")
    	   public String getmap() {
    	      iTravel map=sqlSession.getMapper(iTravel.class);
    	      ArrayList<tra> mapget=map.getmap();
    	      JSONArray ja=new JSONArray();
    	      for(int i=0;i<mapget.size();i++) {
    	         JSONObject jo=new JSONObject();
    	         jo.put("cod",mapget.get(i).getCod());
    	         jo.put("adr",mapget.get(i).getAdr());
    	         jo.put("id",mapget.get(i).getId());
    	         jo.put("name",mapget.get(i).getName());
    	      
    	         ja.add(jo);
    	      }   
    	   return ja.toString();
    	   }
    	   @ResponseBody
    	   @RequestMapping(value="/getcity",method=RequestMethod.GET,
    	            produces="application/json;charset=utf-8")
    	   public String getCity() {
    	      iTravel city=sqlSession.getMapper(iTravel.class);
    	      ArrayList<city> getcity=city.getcity();
    	      JSONArray ja=new JSONArray();
    	      for(int i=0;i<getcity.size();i++) {
    	         JSONObject jo=new JSONObject();         
    	         jo.put("id",getcity.get(i).getId());
    	         jo.put("name",getcity.get(i).getName());
    	         jo.put("kloc",getcity.get(i).getKloc());
    	         ja.add(jo);
    	      }   
    	      
    	   return ja.toString();
    	   }
    	   @ResponseBody
    	   @RequestMapping(value="/pointcity",method=RequestMethod.GET,
    	            produces="application/json;charset=utf-8")
    	   public String pointcity(HttpServletRequest hsr) {
    	      String loc=hsr.getParameter("loc");
    	      iTravel city=sqlSession.getMapper(iTravel.class);
    	      ArrayList<bando> getcod=city.getcod(loc);
    	      JSONArray ja=new JSONArray();
    	      for(int i=0;i<getcod.size();i++) {
    	         JSONObject jo=new JSONObject();         
    	         jo.put("adr",getcod.get(i).getAdr());
    	         jo.put("name",getcod.get(i).getName());
    	         jo.put("cod",getcod.get(i).getCod());
    	      
    	         ja.add(jo);
    	      }   
    	   return ja.toString();
    	   }
    	   
    	   @ResponseBody
    	   @RequestMapping(value="/getban",method=RequestMethod.GET,
    	            produces="application/json;charset=utf-8")
    	   public String ty() {
    	      
    	      iTravel city=sqlSession.getMapper(iTravel.class);
    	      ArrayList<bando> getcod=city.getban();
    	      JSONArray ja=new JSONArray();
    	      for(int i=0;i<getcod.size();i++) {
    	         JSONObject jo=new JSONObject();         
    	         jo.put("adr",getcod.get(i).getAdr());         
    	      
    	         ja.add(jo);
    	      }   
    	   return ja.toString();
    	   }
    	   @ResponseBody
    	   @RequestMapping(value="/topadr",method=RequestMethod.POST,
    	            produces="application/json;charset=utf-8")
    	   public String topadr(Model m) {
    	      iTravel map=sqlSession.getMapper(iTravel.class);
    	      ArrayList<bando> mapget=map.topadr();
    	      JSONArray ja=new JSONArray();
    	      
    	      for(int i=0;i<mapget.size();i++) {
    	         JSONObject jo=new JSONObject();
    	         jo.put("cod",mapget.get(i).getCod());
    	         jo.put("adr",mapget.get(i).getAdr());
    	         jo.put("id",mapget.get(i).getId());
    	         jo.put("name",mapget.get(i).getName());
    	         jo.put("hit",mapget.get(i).getHit());
    	         jo.put("loc",mapget.get(i).getLoc());
    	         ja.add(jo);
    	      }   
    	   return ja.toString();
    	   }
    	   @RequestMapping(value = "/DeleteInfo", method = RequestMethod.GET)
    	   public String DeleteInfo() {
    		   
    	      return "DeleteInfo";
    	   }
    	   @ResponseBody
    	   @RequestMapping(value="/DeleteInfo1", method=RequestMethod.GET,
    	            produces="application/text;charset=utf-8")
    	   public String DeleteInfo1(HttpServletRequest hsr, Model m) {
    		   String retval="";
    		   String userid=hsr.getParameter("userid");
    		   String password=hsr.getParameter("password");
    		   
    		   iTravel tr = sqlSession.getMapper(iTravel.class);
    		   ArrayList<member> t=tr.lookMember(userid);
    		   
     	      for(int i=0;i<t.size();i++) {
     	    	if(t.get(i).getUserid().equals(userid) && t.get(i).getPassword().equals(password)){
     	    		 tr.deleteMember(userid);
     	    		 retval="ok";
     	    		 
     	    		 break;
     	    	 }else {
     	    		 retval="fail";
     	    	 }
     	      }   
     	      System.out.println(retval);
     	      if(retval=="ok") {
     	    	 HttpSession session = hsr.getSession();
     	    	 session.invalidate();
     	      }
     	     return retval;
    	   }
  
	}