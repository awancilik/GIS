﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34209
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GISPuskesmasData.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "11.0.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=.\\MSSQL2012;Initial Catalog=GISPuskesmas;Persist Security Info=True;U" +
            "ser ID=sa;Password=12345")]
        public string GISPuskesmasConnectionString1 {
            get {
                return ((string)(this["GISPuskesmasConnectionString1"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=GISPuskesmas.mssql.somee.com;Initial Catalog=GISPuskesmas;Persist Sec" +
            "urity Info=True;User ID=poli_SQLLogin_1;Password=771p3lmj6e")]
        public string puskesmasGISDataConnectionString {
            get {
                return ((string)(this["puskesmasGISDataConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=SIGPuskesmas.mssql.somee.com;Initial Catalog=SIGPuskesmas;Persist Sec" +
            "urity Info=True;User ID=poli_SQLLogin_1;Password=771p3lmj6e")]
        public string SIGPuskesmasConnectionString {
            get {
                return ((string)(this["SIGPuskesmasConnectionString"]));
            }
        }
    }
}