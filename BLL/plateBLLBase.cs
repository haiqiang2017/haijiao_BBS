using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using BBS.Entity;
using BBS.DAL;

namespace BBS.BLL
{
    /// <summary>
    /// BLL Layer For dbo.plate.
    /// </summary>
    public class plateBLL
    {
        #region ----------变量定义----------
        ///<summary>
        ///
        ///</summary>
        public static readonly plate _dal = new plate();
        #endregion

        #region ----------构造函数----------
        /// <summary>
        /// 构造函数
        /// </summary>
        public plateBLL()
        {
        }
        #endregion

        #region ----------函数定义----------
        #region 添加更新删除
        /// <summary>
        /// 向数据库中插入一条新记录。
        /// </summary>
        /// <param name="oplateInfo">plate??</param>
        /// <returns>新插入记录的编号</returns>
        public static void plateInsert(plateEntity oplateInfo)
        {
            // Validate input
            if (oplateInfo == null)
                return;
            // Use the dal to insert a new record 
            _dal.plateInsert(oplateInfo);
        }

        /// <summary>
        /// 向数据表plate更新一条记录。
        /// </summary>
        /// <param name="oplateInfo">oplateInfo</param>
        /// <returns>影响的行数</returns>
        public static void plateUpdate(plateEntity oplateInfo)
        {
            // Validate input
            if (oplateInfo == null)
                return;
            // Use the dal to update a new record 
            _dal.plateUpdate(oplateInfo);
        }

        /// <summary>
        /// 删除数据表plate中的一条记录
        /// </summary>
        /// <param name="plateID">plateID</param>
        /// <returns>影响的行数</returns>
        public static void plateDelete(int plateID)
        {
            // Validate input
            if (plateID < 0)
                return;
            _dal.plateDelete(plateID);
        }
        #endregion

        /// <summary>
        /// 得到 plate 数据实体
        /// </summary>
        /// <param name="plateID">plateID</param>
        /// <returns>plate 数据实体</returns>
        public static plateEntity Get_plateEntity(int plateID)
        {
            // Validate input
            if (plateID < 0)
                return null;

            // Use the dal to get a record 
            return _dal.Get_plateEntity(plateID);
        }


        /// <summary>
        /// 很据ParentID不等于0 查询所有的小版块信息
        /// </summary>
        /// <param name="ParentID"></param>
        /// <returns></returns>
        public DataTable GetSmallPlateinfo()
        {
            return new plate().GetSmallPlateinfo();
        }

        /// <summary>
        /// 根据选中的内容获取他们的plateID
        /// </summary>
        /// <param name="PlateName"></param>
        /// <returns></returns>
        public DataTable GetplateIdInfo(string PlateName)
        {
            return new DAL.plate().GetplateIdInfo(PlateName);
        }




        /// <summary>
        /// 根据选中的主版块的的ID添加小版块的信息
        /// </summary>
        /// <param name="platename"></param>
        /// <param name="platestate"></param>
        /// <param name="plateremark"></param>
        /// <param name="ParentID"></param>
        public static void InsertSmallInfo(string PlateName, string PlateState, string PlateRemark, int ParentID)
        {
            DAL.plate.InsertSmallInfo(PlateName, PlateState, PlateRemark, ParentID);
        }




        /// <summary>
        /// 根据版块的父辈的ID获取版块的名字个状态
        /// </summary>
        /// <param name="ParentID"></param>
        /// <returns></returns>
        public DataTable GetPlateModelInfo(int ParentID)
        {
            return new DAL.plate().GetPlateModelInfo(ParentID);
        }




        /// <summary>
        /// 根据plateID查询到版块的备注
        /// </summary>
        /// <param name="plateID"></param>
        /// <returns></returns>
        public DataTable GetplateRemark(int plateID)
        {
            return new DAL.plate().GetplateRemark(plateID);
        }




        /// <summary>
        /// 后台根据版块的ID删除版块的信息
        /// </summary>
        /// <param name="PlateID"></param>
        public static bool DeletePlateInfo(int PlateID)
        {
            return DAL.plate.DeletePlateInfo(PlateID);
        }



        /// <summary>
        /// 根据点击的版块的ID修改版块的名称
        /// </summary>
        /// <param name="PlateName"></param>
        /// <param name="PlateID"></param>
        /// <returns></returns>
        public static bool UpdatePlateInfo(string PlateName, int PlateID)
        {
            return DAL.plate.UpdatePlateInfo(PlateName, PlateID);

        }


        /// <summary>
        /// 插入主版块信息
        /// </summary>
        /// <param name="plateInfo"></param>
        public static void InsertPlateInfo(plateEntity plateInfo)
        {
            DAL.plate.InsertPlateInfo(plateInfo);
        }


        /// <summary>
        /// 得到数据表plate所有记录
        /// </summary>
        /// <returns>实体集</returns>
        public static List<plateEntity> Get_plateAll()
        {
            // Use the dal to get all records 
            return _dal.Get_plateAll();
        }
        /// <summary>
        ///  根据ParentID查询主页面需要的信息
        /// </summary>
        /// <param name="parentID"></param>
        /// <returns></returns>
        public DataTable GetModuleInfo(int parentID)
        {
            return _dal.GetModuleInfo(parentID);
        }

        #endregion


    }
}

