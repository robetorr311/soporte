using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Text;

public static class Global
{
    static string _Session;
    static string _Us;
    static string _Nbr;
    static string _Nvl;
    public static string Session
    {
        get
        {
            return _Session;
        }
        set
        {
            _Session = value;
        }
    }
    public static string Us
    {
        get
        {
            return _Us;
        }
        set
        {
            _Us = value;
        }
    }
    public static string Nbr
    {
        get
        {
            return _Nbr;
        }
        set
        {
            _Nbr = value;
        }
    }
    public static string Nvl
    {
        get
        {
            return _Nvl;
        }
        set
        {
            _Nvl = value;
        }
    }
}