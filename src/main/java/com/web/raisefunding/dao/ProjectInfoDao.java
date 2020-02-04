package com.web.raisefunding.dao;

import com.web.raisefunding.model.ProjectInfoBean;

public interface ProjectInfoDao  {
	public int createProjInfo(ProjectInfoBean infoBean);
	public int updateProjInfo(ProjectInfoBean infoBean) ;
	public ProjectInfoBean getProject(Integer projectId);


}
