import numpy as np
import pandas as pd
import os

# Call rate
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/fm02_m_1.html"
Call_Rate = pd.DataFrame(pd.io.html.read_html(url)[0])
Call_Rate = Call_Rate.set_axis(['Date', 'Call_Rate_End_Month', 'Call_Rate_Ave_Month'], axis=1)
Call_Rate.drop(Call_Rate.loc[0:6].index, inplace=True)
Call_Rate = Call_Rate.replace({"ND": ""})
Call_Rate["Date"] = pd.DatetimeIndex(Call_Rate["Date"])
Call_Rate["Date"] = Call_Rate['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Lending Interest
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/ir01_m_1.html"
Lend_Int = pd.DataFrame(pd.io.html.read_html(url)[0])
Lend_Int.drop(Lend_Int.loc[0:6].index, inplace=True)
Lend_Int = Lend_Int.set_axis(["Date", "Base_Lend_Rate"], axis=1)
Lend_Int = Lend_Int.replace({"ND": ""})
Lend_Int["Date"] = pd.DatetimeIndex(Lend_Int["Date"])
Lend_Int["Date"] = Lend_Int['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Monetary Base
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/md01_m_1.html"
MB = pd.DataFrame(pd.io.html.read_html(url)[0])
MB.drop(MB.loc[0:6].index, inplace=True)
MB = MB.set_axis(["Date", "Growth_MB", "Growth_MB_BOJ_Notes_Issued", "Growth_MB_Currency_Circulation",
                  "Growth_MB_BOJ_Current_Deposit", "MB", "MB_BOJ_Notes_Issued", "MB_Currency_Circulation",
                  "MB_BOJ_Current_Deposit"], axis=1)
MB = MB.replace({"ND": ""})
MB["Date"] = pd.DatetimeIndex(MB["Date"])
MB["Date"] = MB['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Fx rate
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/fm08_m_1.html"
FX_Rate = pd.DataFrame(pd.io.html.read_html(url)[0])
FX_Rate.drop(FX_Rate.loc[0:6].index, inplace=True)
FX_Rate = FX_Rate.set_axis(
    ["Date", "FX_End_Month_17PM", "FX_Monthly_Average_17PM", "FX_End_Month_Central", "FX_Monthly_Average_Central",
     "FX_Month_Max", "FX_Month_Min"], axis=1)
FX_Rate = FX_Rate.replace({"ND": ""})
FX_Rate["Date"] = pd.DatetimeIndex(FX_Rate["Date"])
FX_Rate["Date"] = FX_Rate['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))
# Corporate CPI
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/pr01_m_1.html"
Corp_CPI = pd.DataFrame(pd.io.html.read_html(url)[0])
Corp_CPI.drop(Corp_CPI.loc[0:6].index, inplace=True)
Corp_CPI = Corp_CPI.set_axis(["Date", "CGPI_Average_Annual_Growth", "Export_GPI_Average_Annual_Growth",
                              "Import_CPI_Average_Annual_Growth", "Ignore_This",
                              "CGPI_Average", "Ignore_This",
                              "Export_CPI_Average", "Import_CPI_Average", "Ignore_This"], axis=1)
Corp_CPI = Corp_CPI.replace({"ND": ""})
Corp_CPI["Date"] = pd.DatetimeIndex(Corp_CPI["Date"])
Corp_CPI["Date"] = Corp_CPI['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Deposits
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/md11_m_1.html"
Deposits = pd.DataFrame(pd.io.html.read_html(url)[0])
Deposits.drop(Deposits.loc[0:6].index, inplace=True)
Deposits = Deposits.set_axis(["Date", "Total_Lending", "Lending_to_Corporate (Inc.Financial)",
                              "Lending_to_Corporate_for_Facility_Investment",
                              "Lending_to_Corporate_small_mid_Enterprises",
                              "Lending_to_Individual"], axis=1)
Deposits = Deposits.replace({"ND": ""})
Deposits["Date"] = pd.DatetimeIndex(Deposits["Date"])
Deposits["Date"] = Deposits['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Total Lending
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/md13_m_1.html"
Lend_Total = pd.DataFrame(pd.io.html.read_html(url)[0])
Lend_Total.drop(Lend_Total.loc[0:6].index, inplace=True)
Lend_Total = Lend_Total.set_axis(["Date", "Total_Lending_of_Banks_and_Shinkin_Bank", "Total_Lending_of_Banks",
                                  "Growth_of_Total_Lending_of_Banks",
                                  "Total_Lending_of_Metropolitan_Banks",
                                  "Total_Lending_of_All_Local_Banks",
                                  "Total_Lending_of_Large_Local_Banks",
                                  "Total_Lending_of_Small_Local_Banks",
                                  "Total_Lending_of_Shinkin_Banks",
                                  "Total_Lending_of_Foreign_Banks",
                                  "Total_Lending_of_Other_Banks"], axis=1)
Lend_Total = Lend_Total.replace({"ND": ""})
Lend_Total["Date"] = pd.DatetimeIndex(Lend_Total["Date"])
Lend_Total["Date"] = Lend_Total['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))
# Current Account
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/bp01_m_1.html"
Current_Account = pd.DataFrame(pd.io.html.read_html(url)[0])
Current_Account.drop(Current_Account.loc[0:6].index, inplace=True)
Current_Account = Current_Account.set_axis(["Date", "Current_Balance", "Financial_Balance"], axis=1)
Current_Account = Current_Account.replace({"ND": ""})
Current_Account["Date"] = pd.DatetimeIndex(Current_Account["Date"])
Current_Account["Date"] = Current_Account['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Money Supply
url = "http://www.stat-search.boj.or.jp/ssi/mtshtml/md02_m_1.html"
Mon_Sup = pd.DataFrame(pd.io.html.read_html(url)[0])
Mon_Sup.drop(Mon_Sup.loc[0:6].index, inplace=True)
Mon_Sup = Mon_Sup.set_axis(["Date", "Growth_M2", "Growth_M3", "Growth_M1",
                            "Liquidity_Growth", "Cash_Currency_Growth", "Deposit_Currency_Growth",
                            "Quasi-Currency_Growth", "Ignore_This", "M2", "M3", "M1", "Liquidity",
                            "Cash_Currency", "Deposit_Currency", "Quasi_Currency", "Ignore_This"], axis=1)
Mon_Sup = Mon_Sup.replace({"ND": ""})
Mon_Sup["Date"] = pd.DatetimeIndex(Mon_Sup["Date"])
Mon_Sup["Date"] = Mon_Sup['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))

# Bond amount
url = "https://www.stat-search.boj.or.jp/ssi/html/nme_R020MM.3818.20220131234952.01.html"
Bonds = pd.DataFrame(pd.io.html.read_html(url)[0])
Bonds.drop(Bonds.loc[0].index, inplace=True)
Bonds = Bonds.set_axis(["Date", "Total_Bond_Earned", "Total_Bond_Disposed", "Net_Bond_Amount",
                        "Long-Medium_Run_Bond_Earned", "Long-Medium_Run_Bond_Disposed", "Net_Long-Medium_Run_Bond",
                        "Short_Run_Bond_Earned", "Short_Run_Bond_Disposed", "Net_Short_Run_Bond",
                        "BOJ_Asset_Bond"], axis=1)
Bonds = Bonds.replace({"ND": ""})
Bonds["Date"] = pd.DatetimeIndex(Bonds["Date"])
Bonds["Date"] = Bonds['Date'].dt.date.apply(lambda x: x.strftime('%Y-%m-%d'))
# Data Frame
Data = pd.merge(Corp_CPI, Call_Rate, how="left")
Data = pd.merge(Data, Current_Account, how="left")
Data = pd.merge(Data, Deposits, how="left")
Data = pd.merge(Data, FX_Rate, how="left")
Data = pd.merge(Data, Lend_Int, how="left")
Data = pd.merge(Data, Lend_Total, how="left")
del Data["Ignore_This"]
Data = pd.merge(Data, MB, how="left")
Data = pd.merge(Data, Mon_Sup, how="left")
del Data["Ignore_This"]
Data = pd.merge(Data, Bonds, how="left")

os.chdir("/Volumes/TanigakiSSD/EconData/")
Data.to_csv("Japanese_Economics.csv")
