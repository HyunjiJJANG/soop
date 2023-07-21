package kr.co.jhta.soop.service;

import java.util.List;

import kr.co.jhta.soop.dto.ProjectInvitationDTO;

public interface ProjectInvitationService {

	public List<ProjectInvitationDTO> selectAll();

	public ProjectInvitationDTO selectOne(int invitation_no);

	public void insertOne(ProjectInvitationDTO dto);

	public void updateOne(ProjectInvitationDTO dto);

	public void deleteOne(int invitation_no);

}
