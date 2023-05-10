package com.icia.member.repository;

import com.icia.member.dto.MemberDTO;
import com.icia.member.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return sql.selectOne("Member.findByMemberEmail", loginEmail);
    }

//    public void saveFile(MemberFileDTO boardFileDTO) {
//        sql.insert("Member.saveFile", memberFileDTO);
//    }

//    public List<MemberFileDTO> findFile(Long boardId) {
//        return sql.selectList("Member.findFile", memberId);
//    }
}
