package com.icia.member.service;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import com.icia.member.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

//    public int save(MemberDTO memberDTO) {
//        return memberRepository.save(memberDTO);
//    }

    public int save(MemberDTO memberDTO) throws IOException {
        // 파일 있음, 없음.
        if(memberDTO.getMemberProfile().get(0).isEmpty()) {
            // 파일 없음
            System.out.println("파일없음");
            memberDTO.setFileAttached(0);
            memberRepository.save(memberDTO);
        } else {
            // 파일 있음.
            /*
                1. 파일첨부 여부 값 1로 세팅하고 DB에 제목 등 내용 board_table에 저장 처리
                2. 파일의 이름을 가져오고 DTO 필드값에 세팅
                3. 저장용 파일 이름 만들고 DTO 필드값에 세팅
                4. 로컬에 파일 저장
                5. board_file_table에 저장 처리
             */
            System.out.println("파일있음");
            memberDTO.setFileAttached(1);
            MemberDTO dto = memberRepository.save(memberDTO);
            for(MultipartFile memberProfile : memberDTO.getMemberProfile()) {
                // 원본 파일 이름 가져오기
//                String originalFilename = boardDTO.getBoardFile().getOriginalFilename();
                String originalFilename = memberProfile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                System.out.println(UUID.randomUUID().toString());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // 저장을 위한 BoardFileDTO 세팅
                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setOriginalMemberFileName(originalFilename);
                memberFileDTO.setStoredMemberFileName(storedFileName);
                memberFileDTO.setMemberId(dto.getId());
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할폴더+저장할이름)
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리
//                boardDTO.getBoardFile().transferTo(new File(savePath));
                memberFile.transferTo(new File(savePath));
                memberRepository.saveFile(memberFileDTO);
            }
        }
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

//    public List<MemberFileDTO> findFile(Long id) {
//        return memberRepository.findFile(id);
//    }
}
