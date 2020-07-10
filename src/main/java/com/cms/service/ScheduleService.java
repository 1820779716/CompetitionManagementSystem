package com.cms.service;

import net.sf.json.JSONArray;


public interface ScheduleService {

    /**
     * 根据参赛者ID查询成绩
     *
     * @param competitorId:参赛者成绩
     * @return 当前查询的用户的所有竞赛成绩
     */
    public JSONArray selectGradeByCompetitorId(String competitorId);

    /**
     * 根据竞赛ID查询成绩
     *
     * @param cid: 某次竞赛所有成绩
     * @return 当前查询的竞赛所有参赛者成绩
     */
    public JSONArray selectGradeByCid(String cid);

    /**
     * 获取一等奖人数
     *
     * @return 人数
     */
    public int selectGradeA();

    /**
     * 获取二等奖人数
     *
     * @return 人数
     */
    public int selectGradeB();

    /**
     * 获取三等奖人数
     *
     * @return 人数
     */
    public int selectGradeC();

    /**
     * 获取未获奖人数
     *
     * @return 人数
     */
    public int selectGradeD();

    /**
     * 获取各个等级的人数
     *
     * @return
     */
    public JSONArray getAllLevelCount();
}
