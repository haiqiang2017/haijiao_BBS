using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Collections;
using System.Reflection;

/// <summary>
///DB 的摘要说明
/// </summary>
public class DB
{
    //public db()
    //{
    //    //
    //    //todo: 在此处添加构造函数逻辑
    //    //
    //}
    //public int excutesql(string strcmd)
    //{
    protected OracleConnection Connection;
    private string connectionString;
    /// <summary>
    /// 练级字符串
    /// </summary>
    public DB()
    {
        string connStr;
        connStr = System.Configuration.ConfigurationSettings.AppSettings["connstring"].ToString();
        connectionString = connStr;
        Connection = new OracleConnection(connectionString);
    }

    #region 带参数的构造函数
    /// <summary>
    /// 带参数的构造函数
    /// </summary>
    /// <param name="ConnString">数据库联接字符串</param>
    public DB(string ConnString)
    {
        string connStr;
        connStr = System.Configuration.ConfigurationSettings.AppSettings[ConnString].ToString();
        Connection = new OracleConnection(connStr);
    }
    #endregion


    #region 打开数据库
    /// <summary>
    /// 打开数据库
    /// </summary>
    public void OpenConn()
    {
        if (this.Connection.State != ConnectionState.Open)
            this.Connection.Open();
    }
    #endregion

    #region 关闭数据库联接
    /// <summary>
    /// 关闭数据库联接
    /// </summary>
    public void CloseConn()
    {
        if (Connection.State == ConnectionState.Open)
            Connection.Close();
    }
    #endregion




    #region  执行SQL语句，返回Bool值
    /// <summary>
    /// 执行SQL语句，返回Bool值
    /// </summary>
    /// <param name="sql">要执行的SQL语句</param>
    /// <returns>返回BOOL值，True为执行成功</returns>
    public bool ExecuteSQL(string sql)
    {
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        try
        {
            command.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            CloseConn();
        }
    }
    #endregion

    #region 执行SQL语句,返回所影响的行数
    /// <summary>
    /// 执行SQL语句,返回所影响的行数
    /// </summary>
    /// <param name="sql"></param>
    /// <returns></returns>
    public int ExecuteSql(string sql)
    {
        int Cmd = 0;
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        try
        {
            Cmd = command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
        }
        finally
        {
            CloseConn();
        }

        return Cmd;
    }
    #endregion




    #region  执行SQL语句，返回Bool值
    /// <summary>
    /// 执行SQL语句，返回Bool值
    /// </summary>
    /// <param name="sql">要执行的SQL语句</param>
    /// <returns>返回BOOL值，True为执行成功</returns>
    public bool ExecuteSQL(OracleCommand cmd)
    {
        OpenConn();
        try
        {

            cmd.ExecuteNonQuery();
            return true;
        }
        catch (System.Exception ex)
        {
            return false;
        }
        finally
        {
            CloseConn();
        }
    }
    #endregion

    #region  执行SQL语句，返回DataSet
    /// <summary>
    /// 执行SQL语句，返回DataSet
    /// </summary>
    /// <param name="sql">要执行的SQL语句</param>
    /// <param name="tablename">DataSet中要填充的表名</param>
    /// <returns>返回dataSet类型的执行结果</returns>
    public DataSet GetDataSet(string sql, string tablename)
    {
        DataSet ds = new DataSet();
        OpenConn();
        OracleDataAdapter da = new OracleDataAdapter(sql, Connection);

        try
        {
            da.Fill(ds, tablename);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
        return ds;
    }

    //重载
    public DataSet GetDataSet(OracleDataAdapter da, string sql, string tablename)
    {
        DataSet ds = new DataSet();
        OpenConn();
        OracleDataAdapter da1 = new OracleDataAdapter(sql, Connection);
        da = da1;
        try
        {
            da.Fill(ds, tablename);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
        return ds;
    }
    #endregion



    #region 执行SQL语句，返回数据到DataTable中
    public DataTable GetDataTable(string sql)
    {
        DataSet ds = new DataSet();
        OpenConn();
        OracleDataAdapter da = new OracleDataAdapter(sql, Connection);

        try
        {
            da.Fill(ds, "tb");
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
        DataTable result = ds.Tables["tb"];

        return result;
    }
    #endregion



    public DataTable dataTable(string sql)
    {
        OracleDataAdapter da = new OracleDataAdapter(sql, Connection);
        DataTable datatable = new DataTable();
        try
        {
            OpenConn();
            da.Fill(datatable);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
        return datatable;
    }

    /// <summary> 
    /// 执行指定Sql语句,同时给传入DataTable进行赋值 
    /// </summary> 
    /// <param name="sqlstr">传入的Sql语句</param> 
    /// <param name="dt">ref DataTable dt </param> 
    public void dataTable(string sql, ref DataTable dt)
    {
        OracleDataAdapter da = new OracleDataAdapter(sql, Connection);
        try
        {
            OpenConn();
            da.Fill(dt);
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
    }



    #region  执行SQL语句并返回受影响的行数
    /// <summary>
    /// 执行SQL语句并返回受影响的行数
    /// </summary>
    /// <param name="sql">要执行的SQL语句</param>
    /// <returns>返回Int类型的受影响的行数</returns>
    public int GetCount(string sql)
    {
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        try
        {

            int count = Convert.ToInt32(command.ExecuteScalar());

            return count;
        }
        catch (Exception ex)
        {
            return 0;
        }
        finally
        {
            CloseConn();
            command.Dispose();
        }
    }
    #endregion

    #region //DropDownList加载数据，没有空项
    public DropDownList SetDdl(string sql, DropDownList ddl)
    {
        DataTable dt = new DataTable();

        dt = GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddl.Items.Add(dt.Rows[i].ItemArray[0].ToString());
            }
        }
        return ddl;
    }
    #endregion
    #region //DropDownList加载数据，第一项为空
    public DropDownList SetDdl1(string sql, DropDownList ddl)
    {
        DataTable dt = new DataTable();

        dt = GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            ddl.Items.Add("");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddl.Items.Add(dt.Rows[i].ItemArray[0].ToString());
            }
        }
        return ddl;
    }
    #endregion

    #region //根据查询语句 获得数据 并绑定到dropdowntlist
    public DropDownList SetDdl2(string sql, DropDownList ddl, int TextIndex, int ValueIndex)
    {
        DataTable dt = new DataTable();
        dt = GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            ddl.DataSource = dt.DefaultView;
            ddl.DataTextField = dt.Columns[TextIndex].ColumnName;
            ddl.DataValueField = dt.Columns[ValueIndex].ColumnName;
            ddl.DataBind();
        }
        return ddl;
    }
    #endregion

    #region //根据查询语句 获得数据 并绑定到dropdowntlist
    public void BindDropDownList(DataTable dt, DropDownList ddl, int TextIndex, int ValueIndex)
    {
        ddl.DataSource = dt.DefaultView;
        ddl.DataTextField = dt.Columns[TextIndex].ColumnName;
        ddl.DataValueField = dt.Columns[ValueIndex].ColumnName;
        ddl.DataBind();
    }
    #endregion


    //用户登录
    public int UserLogIn(string sql)
    {
        int flag = 0;
        string user = "";
        string dm = "";
        //DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        OpenConn();
        OracleDataAdapter da = new OracleDataAdapter(sql, Connection);
        try
        {
            da.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                user = dt.Rows[0]["user"].ToString();
                dm = dt.Rows[0]["DM"].ToString();

            }


        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
        finally
        {
            CloseConn();
            da.Dispose();
        }
        if (dt.Rows.Count != 0)
            flag = 1;
        return flag;
    }



    #region 执行SQL语句，返回数据到DataSet中
    /// <summary>
    /// 执行SQL语句，返回数据到DataSet中
    /// </summary>
    /// <param name="sql">sql语句</param>
    /// <param name="DataSetName">自定义返回的DataSet表名</param>
    /// <returns>返回DataSet</returns>
    public DataSet ReturnDataSet(string sql, string DataSetName)
    {
        DataSet dataSet = new DataSet();
        OpenConn();
        OracleDataAdapter OraDA = new OracleDataAdapter(sql, Connection);
        OraDA.Fill(dataSet, DataSetName);
        //    CloseConn();
        return dataSet;
    }
    #endregion

    #region 执行Sql语句,返回带分页功能的dataset
    /// <summary>
    /// 执行Sql语句,返回带分页功能的dataset
    /// </summary>
    /// <param name="sql">Sql语句</param>
    /// <param name="PageSize">每页显示记录数</param>
    /// <param name="CurrPageIndex"><当前页/param>
    /// <param name="DataSetName">返回dataset表名</param>
    /// <returns>返回DataSet</returns>
    public DataSet ReturnDataSet(string sql, int PageSize, int CurrPageIndex, string DataSetName)
    {
        DataSet dataSet = new DataSet();
        OpenConn();
        OracleDataAdapter OraDA = new OracleDataAdapter(sql, Connection);
        OraDA.Fill(dataSet, PageSize * (CurrPageIndex - 1), PageSize, DataSetName);
        //    CloseConn();
        return dataSet;
    }
    #endregion

    #region 执行SQL语句，返回 DataReader,用之前一定要先.read()打开,然后才能读到数据
    /// <summary>
    /// 执行SQL语句，返回 DataReader,用之前一定要先.read()打开,然后才能读到数据
    /// </summary>
    /// <param name="sql">sql语句</param>
    /// <returns>返回一个OracleDataReader</returns>
    public OracleDataReader ReturnDataReader(String sql)
    {
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        return command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
    }
    #endregion

    #region 执行SQL语句，返回记录总数数
    /// <summary>
    /// 执行SQL语句，返回记录总数数
    /// </summary>
    /// <param name="sql">sql语句</param>
    /// <returns>返回记录总条数</returns>
    public int GetRecordCount(string sql)
    {
        int recordCount = 0;
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        OracleDataReader dataReader = command.ExecuteReader();
        while (dataReader.Read())
        {
            recordCount++;
        }
        dataReader.Close();
        //    CloseConn();
        return recordCount;
    }
    #endregion

    #region 取当前序列,条件为seq.nextval或seq.currval
    /// <summary>
    /// 取当前序列
    /// </summary>
    /// <param name="seqstr"></param>
    /// <param name="table"></param>
    /// <returns></returns>
    public decimal GetSeq(string seqstr)
    {
        decimal seqnum = 0;
        string sql = "select " + seqstr + " from dual";
        OpenConn();
        OracleCommand command = new OracleCommand(sql, Connection);
        OracleDataReader dataReader = command.ExecuteReader();
        if (dataReader.Read())
        {
            seqnum = decimal.Parse(dataReader[0].ToString());
        }
        dataReader.Close();
        //    CloseConn();
        return seqnum;
    }
    #endregion



    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    //　＝＝用hashTable对数据库进行insert,update,del操作,注意此时只能用默认的数据库连接"connstr"＝＝
    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

    #region 根据表名及哈稀表自动插入数据库 用法：Insert("test",ht)
    public int Insert(string TableName, Hashtable ht)
    {
        OracleParameter[] Parms = new OracleParameter[ht.Count];
        IDictionaryEnumerator et = ht.GetEnumerator();
        DataTable dt = GetTabType(TableName);
        System.Data.OracleClient.OracleType otype;
        int size = 0;
        int i = 0;

        while (et.MoveNext()) // 作哈希表循环
        {
            GetoType(et.Key.ToString().ToUpper(), dt, out otype, out size);
            System.Data.OracleClient.OracleParameter op = MakeParam(":" + et.Key.ToString(), otype, size, et.Value.ToString());
            Parms[i] = op; // 添加SqlParameter对象
            i = i + 1;
        }
        string str_Sql = GetInsertSqlbyHt(TableName, ht); // 获得插入sql语句
        int val = ExecuteNonQuery(str_Sql, Parms);
        return val;
    }
    #endregion

    #region 根据相关条件对数据库进行更新操作 用法：Update("test","Id=:Id",ht);
    public int Update(string TableName, string ht_Where, Hashtable ht)
    {
        OracleParameter[] Parms = new OracleParameter[ht.Count];
        IDictionaryEnumerator et = ht.GetEnumerator();
        DataTable dt = GetTabType(TableName);
        System.Data.OracleClient.OracleType otype;
        int size = 0;
        int i = 0;
        // 作哈希表循环
        while (et.MoveNext())
        {
            GetoType(et.Key.ToString().ToUpper(), dt, out otype, out size);
            System.Data.OracleClient.OracleParameter op = MakeParam(":" + et.Key.ToString(), otype, size, et.Value.ToString());
            Parms[i] = op; // 添加SqlParameter对象
            i = i + 1;
        }
        string str_Sql = GetUpdateSqlbyHt(TableName, ht_Where, ht); // 获得插入sql语句
        int val = ExecuteNonQuery(str_Sql, Parms);
        return val;
    }
    #endregion

    #region del操作,注意此处条件个数与hash里参数个数应该一致 用法：Del("test","Id=:Id",ht)
    public int Del(string TableName, string ht_Where, Hashtable ht)
    {
        OracleParameter[] Parms = new OracleParameter[ht.Count];
        IDictionaryEnumerator et = ht.GetEnumerator();
        DataTable dt = GetTabType(TableName);
        System.Data.OracleClient.OracleType otype;
        int i = 0;
        int size = 0;
        // 作哈希表循环
        while (et.MoveNext())
        {
            GetoType(et.Key.ToString().ToUpper(), dt, out otype, out size);
            System.Data.OracleClient.OracleParameter op = MakeParam(":" + et.Key.ToString(), et.Value.ToString());
            Parms[i] = op; // 添加SqlParameter对象
            i = i + 1;
        }
        string str_Sql = GetDelSqlbyHt(TableName, ht_Where, ht); // 获得删除sql语句
        int val = ExecuteNonQuery(str_Sql, Parms);
        return val;
    }
    #endregion

    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    //　＝＝＝＝＝＝＝＝上面三个操作的内部调用函数＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

    #region 根据哈稀表及表名自动生成相应insert语句(参数类型的)
    /// <summary>
    /// 根据哈稀表及表名自动生成相应insert语句
    /// </summary>
    /// <param name="TableName">要插入的表名</param>
    /// <param name="ht">哈稀表</param>
    /// <returns>返回sql语句</returns>
    public static string GetInsertSqlbyHt(string TableName, Hashtable ht)
    {
        string str_Sql = "";
        int i = 0;
        int ht_Count = ht.Count; // 哈希表个数
        IDictionaryEnumerator myEnumerator = ht.GetEnumerator();
        string before = "";
        string behide = "";
        while (myEnumerator.MoveNext())
        {
            if (i == 0)
            {
                before = "(" + myEnumerator.Key;
            }
            else if (i + 1 == ht_Count)
            {
                before = before + "," + myEnumerator.Key + ")";
            }
            else
            {
                before = before + "," + myEnumerator.Key;
            }
            i = i + 1;
        }
        behide = " Values" + before.Replace(",", ",:").Replace("(", "(:");
        str_Sql = "Insert into " + TableName + before + behide;
        return str_Sql;
    }
    #endregion

    #region 根据表名，where条件，哈稀表自动生成更新语句(参数类型的)
    public static string GetUpdateSqlbyHt(string Table, string ht_Where, Hashtable ht)
    {
        string str_Sql = "";
        int i = 0;
        int ht_Count = ht.Count; // 哈希表个数
        IDictionaryEnumerator myEnumerator = ht.GetEnumerator();
        while (myEnumerator.MoveNext())
        {
            if (i == 0)
            {
                if (ht_Where.ToString().ToLower().IndexOf((myEnumerator.Key + "=:" + myEnumerator.Key).ToLower()) == -1)
                {
                    str_Sql = myEnumerator.Key + "=:" + myEnumerator.Key;
                }
            }
            else
            {
                if (ht_Where.ToString().ToLower().IndexOf((":" + myEnumerator.Key + " ").ToLower()) == -1)
                {
                    str_Sql = str_Sql + "," + myEnumerator.Key + "=:" + myEnumerator.Key;
                }

            }
            i = i + 1;
        }
        if (ht_Where == null || ht_Where.Replace(" ", "") == "") // 更新时候没有条件
        {
            str_Sql = "update " + Table + " set " + str_Sql;
        }
        else
        {
            str_Sql = "update " + Table + " set " + str_Sql + " where " + ht_Where;
        }
        str_Sql = str_Sql.Replace("set ,", "set ").Replace("update ,", "update ");
        return str_Sql;
    }
    #endregion

    #region 根据表名，where条件，哈稀表自动生成del语句(参数类型的)
    public static string GetDelSqlbyHt(string Table, string ht_Where, Hashtable ht)
    {
        string str_Sql = "";
        int i = 0;

        int ht_Count = ht.Count; // 哈希表个数
        IDictionaryEnumerator myEnumerator = ht.GetEnumerator();
        while (myEnumerator.MoveNext())
        {
            if (i == 0)
            {
                if (ht_Where.ToString().ToLower().IndexOf((myEnumerator.Key + "=:" + myEnumerator.Key).ToLower()) == -1)
                {
                    str_Sql = myEnumerator.Key + "=:" + myEnumerator.Key;
                }
            }
            else
            {
                if (ht_Where.ToString().ToLower().IndexOf((":" + myEnumerator.Key + " ").ToLower()) == -1)
                {
                    str_Sql = str_Sql + "," + myEnumerator.Key + "=:" + myEnumerator.Key;
                }

            }
            i = i + 1;
        }
        if (ht_Where == null || ht_Where.Replace(" ", "") == "") // 更新时候没有条件
        {
            str_Sql = "Delete " + Table;
        }
        else
        {
            str_Sql = "Delete " + Table + " where " + ht_Where;
        }
        return str_Sql;
    }
    #endregion

    #region 生成oracle参数
    /// <summary>
    /// 生成oracle参数
    /// </summary>
    /// <param name="ParamName">字段名</param>
    /// <param name="otype">数据类型</param>
    /// <param name="size">数据大小</param>
    /// <param name="Value">值</param>
    /// <returns></returns>
    public static OracleParameter MakeParam(string ParamName, System.Data.OracleClient.OracleType otype, int size, Object Value)
    {
        OracleParameter para = new OracleParameter(ParamName, Value);
        para.OracleType = otype;
        para.Size = size;
        return para;
    }
    #endregion

    #region 生成oracle参数
    public static OracleParameter MakeParam(string ParamName, string Value)
    {
        return new OracleParameter(ParamName, Value);
    }
    #endregion

    #region 根据表结构字段的类型和长度拼装oracle sql语句参数
    public static void GetoType(string key, DataTable dt, out System.Data.OracleClient.OracleType otype, out int size)
    {

        DataView dv = dt.DefaultView;
        dv.RowFilter = "column_name='" + key + "'";
        string fType = dv[0]["data_type"].ToString().ToUpper();
        switch (fType)
        {
            case "DATE":
                otype = OracleType.DateTime;
                size = int.Parse(dv[0]["data_length"].ToString());
                break;
            case "CHAR":
                otype = OracleType.Char;
                size = int.Parse(dv[0]["data_length"].ToString());
                break;
            case "LONG":
                otype = OracleType.Double;
                size = int.Parse(dv[0]["data_length"].ToString());
                break;
            case "NVARCHAR2":
                otype = OracleType.NVarChar;
                size = int.Parse(dv[0]["data_length"].ToString());
                break;
            case "VARCHAR2":
                otype = OracleType.NVarChar;
                size = int.Parse(dv[0]["data_length"].ToString());
                break;
            default:
                otype = OracleType.NVarChar;
                size = 100;
                break;
        }
    }
    #endregion

    #region 动态取表里字段的类型和长度,此处没有动态用到connstr,是默认的！by/文少
    public System.Data.DataTable GetTabType(string tabnale)
    {
        string sql = "select column_name,data_type,data_length from all_tab_columns where table_name='" + tabnale.ToUpper() + "'";
        OpenConn();
        return (ReturnDataSet(sql, "dv")).Tables[0];

    }
    #endregion

    #region 执行sql语句
    public int ExecuteNonQuery(string cmdText, params OracleParameter[] cmdParms)
    {

        OracleCommand cmd = new OracleCommand();
        OpenConn();
        cmd.Connection = Connection;
        cmd.CommandText = cmdText;
        if (cmdParms != null)
        {
            foreach (OracleParameter parm in cmdParms)
                cmd.Parameters.Add(parm);
        }
        int val = cmd.ExecuteNonQuery();
        cmd.Parameters.Clear();
        //    conn.CloseConn();
        return val;
    }
    #endregion

    #region 根据队名获取矿名
    public string GetKM(string DM)
    {
        string km = "";
        DB db = new DB();
        string sql = "select km from t_dept where dm = '" + DM + "'";
        System.Data.DataTable dt = new System.Data.DataTable();
        dt = db.GetDataTable(sql);
        if (dt.Rows.Count > 0)
        {
            km = dt.Rows[0][0].ToString();
        }
        return km;

    }
    #endregion
    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    //　＝＝＝＝＝＝＝＝＝内部调用函数完＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

    //　＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
}
//        string str_connect = "data source = HAIQIANG; user id = system; password = 123;";
//        OleDbConnection conn = new OleDbConnection(str_connect);
//        conn.Open();
//        OleDbCommand cmd = new OleDbCommand(strcmd,conn);
//        int c=cmd.ExecuteNonQuery();
//        conn.Close();
//        return c;
//    }
//    public DataSet getdata(string sql)
//    {
//        string str_connect = "data source = HAIQIANG; user id = system; password = 123;";
//        OleDbConnection conn = new OleDbConnection(str_connect);
//        conn.Open();
//        OleDbCommand cmd = new OleDbCommand(sql, conn);
//        OleDbDataAdapter adp = new OleDbDataAdapter(cmd);
//        DataSet ds = new DataSet();
//        adp.Fill(ds);
//        conn.Close();
//        return ds;
//    }

//}
