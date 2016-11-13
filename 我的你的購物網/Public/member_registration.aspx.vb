Public Partial Class WebForm5
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        CheckLockStep() '處理權限鎖定部份
    End Sub

    Private Sub CheckLockStep()
        If Session("regLockTime") Is Nothing Then
            If MainMultiView.ActiveViewIndex = 1 Then RefreshCodeImage() '建立新的[驗證碼圖片]
        ElseIf Session("regLockTime") > Now Then
            MainMultiView.SetActiveView(NoAuthView) '跳至沒有權限的頁面
        ElseIf Session("regLockTime") <= Now Then
            Session.Remove("regLockTime")
            MainMultiView.SetActiveView(Step1View) '跳至驗證碼的頁面
        End If
    End Sub '處理權限鎖定部份

    Private Sub ShowPreButtonAndNextButton(ByVal CurrentStep As SByte)
        PreStepButton.Visible = If(CurrentStep = 4, True, False)
        NextStepButton.Visible = If((CurrentStep >= 2 AndAlso CurrentStep < 5) OrElse (CurrentStep = 1 AndAlso CodeMultiView.ActiveViewIndex = 2), True, False)
    End Sub '顯示或隱藏上一步＆下一步按鈕

    Private Sub Member_Reg_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        StepTableLabel.Text = webModule.GenerateStepTable(MainMultiView.ActiveViewIndex, _
                                    New String() {"(1)輸入驗證碼", "(2)同意本站規定", "(3)填寫基本資料", "(4)確認註冊資料", "(5)完成註冊"}, _
                                    ResolveUrl("~\css\step.css")) '顯示目前步驟進度條
        ShowPreButtonAndNextButton(MainMultiView.ActiveViewIndex) '控制[上一步][下一步]按鈕的顯示
    End Sub '頁面完成時

    Protected Sub CheckCodeButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CheckCodeButton.Click
        If Session("ValidateCode") = CodeTextBox.Text Then
            MainMultiView.SetActiveView(Step2View) '輸入正確，進行下一步驟
            regFailCustomValidator.IsValid = True
        Else
            If CBool(Application(HeadTag & "enableRegTry")) Then '如果啟用嘗試
                If Session("regTryTimes") Is Nothing Then Session("regTryTimes") = Application(HeadTag & "regTryTimes") '錯誤次數'輸入錯誤
                Session("regTryTimes") -= If(Session("regTryTimes") - 1 >= 0, 1, 0) '直到0為止
                If Session("regTryTimes") > 0 Then
                    RefreshCodeImage() '重新建立新的[驗證碼圖片]
                Else
                    Session("regLockTime") = Now.AddMinutes(CInt(Application(HeadTag & "lockFailRegTryTime")))
                    MainMultiView.SetActiveView(NoAuthView)
                End If
                tryCodeNoticeLabel.Text = "請注意：您只剩" & Session("regTryTimes") & "次機會嘗試" & _
                                          "，輸入失敗會導致系統暫時鎖定您註冊" & Application(HeadTag & "lockFailRegTryTime") & "分鐘"
            Else
                tryCodeNoticeLabel.Text = String.Empty
            End If
            regFailCustomValidator.IsValid = False
        End If
        CodeTextBox.Text = String.Empty
    End Sub '檢查輸入的[驗證碼]是否正確

    Private Sub RefreshCodeImage()
        Dim CodeImage As New Image
        Dim TimeStr As String = Now.ToString("hh_MM_ss")
        CodeImage.ImageUrl = "~/Function/ValidateCode.aspx?ls=" & TimeStr
        CodePlaceHolder.Controls.Clear()
        CodePlaceHolder.Controls.Add(CodeImage)
    End Sub '建立[驗證碼]圖片

    Protected Sub PreStepButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles PreStepButton.Click
        If Page.IsValid Then MainMultiView.ActiveViewIndex -= 1
    End Sub '上一頁

    Protected Sub NextStepButton_Click(ByVal sender As Object, ByVal e As EventArgs) Handles NextStepButton.Click
        If Page.IsValid Then MainMultiView.ActiveViewIndex += 1
    End Sub '下一頁

    Protected Sub IdenficationTextBoxCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles IdentificationCardNumTextBoxCustomValidator.ServerValidate
        args.IsValid = IdentificationCheck(args.Value)
    End Sub '檢查身份証字號正確性

    Protected Sub EMailTextBoxCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles EMailTextBoxCustomValidator.ServerValidate
        args.IsValid = Not AuthModule.DataIsRepeat(ConfigurationManager.ConnectionStrings("AccessDb"), _
                                  " SELECT Count(電子郵件.id) AS id之計數 " & _
                                  " FROM(電子郵件) " & _
                                  " GROUP BY 電子郵件.電子郵件 " & _
                                  " HAVING (((電子郵件.電子郵件)=""" & EMailTextBox.Text.Trim & """));")
    End Sub '檢查電子郵件重複

    Protected Sub IdenficationTextBoxCheckRepeatValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles IdentificationCardNumTextBoxCheckRepeatValidator.ServerValidate
        args.IsValid = Not AuthModule.DataIsRepeat(ConfigurationManager.ConnectionStrings("AccessDb"), _
                                  " SELECT Count(人員.id) AS id之筆數 " & _
                                  " FROM 人員 " & _
                                  " GROUP BY 人員.身份證字號 " & _
                                  " HAVING (((人員.身份證字號)=""" & IdentificationCardNumTextBox.Text.Trim & """));")
    End Sub '檢查身份証字號重複

    Protected Sub MainMultiView_ActiveViewChanged(ByVal sender As Object, ByVal e As EventArgs) Handles MainMultiView.ActiveViewChanged
        If sender.ActiveViewIndex = 3 Then
            BirthdayTextBoxRangeValidator.MaximumValue = Now.AddDays(-1).ToString("yyyy/MM/dd")
        ElseIf sender.ActiveViewIndex = 4 Then
            Session("pw") = PasswordTextBox.Text '儲存寫入密碼部份
            EMailLabel.Text = EMailTextBox.Text
            NameLabel.Text = NameTextBox.Text
            SexLabel.Text = SexRadioButtonList.SelectedItem.Text
            BirthdayLabel.Text = BirthdayTextBox.Text
            CellPhoneLabel.Text = If(String.IsNullOrEmpty(CellPhoneTextBox.Text), "(未填寫)", CDbl(CellPhoneTextBox.Text).ToString("0000-000-000"))
            HomePhoneLabel.Text = If(String.IsNullOrEmpty(HomePhoneTextBox.Text), "(未填寫)", CDbl(HomePhoneTextBox.Text).ToString("(00)0000-0000"))
            IdentificationCardNumLabel.Text = IdentificationCardNumTextBox.Text.Substring(0, 3) & _
            "****" & _
            IdentificationCardNumTextBox.Text.Substring(7, 3)
        ElseIf sender.ActiveViewIndex = 5 Then
            Dim connection As New OleDb.OleDbConnection(SystemSetting.DbConnStr.ConnectionString)
            connection.Open()
            Dim Transaction As OleDb.OleDbTransaction = connection.BeginTransaction '開始交易程序，不能平行處理(同一次只能進行一次Transaction
            Try
                Application.Lock()
                Dim command As New OleDb.OleDbCommand(" INSERT INTO 人員 ( 密碼, 姓名, 性別, 生日, 手機號碼, 室內電話, 身份證字號 ) " & _
                                                                                  " VALUES           ( """ & Session("pw") & """," & _
                                                                                                      """" & NameTextBox.Text & """," & _
                                                                                                      "" & SexRadioButtonList.SelectedValue & "," & _
                                                                                                      "CDate(""" & BirthdayTextBox.Text & """)," & _
                                                                                                      """" & CellPhoneTextBox.Text & """," & _
                                                                                                      """" & HomePhoneTextBox.Text & """," & _
                                                                                                      """" & IdentificationCardNumTextBox.Text & """);", connection)
                command.Transaction = Transaction
                Dim rowNum As Byte = command.ExecuteNonQuery '前面要設定command.Transaction = Transaction
                If rowNum <> 1 Then Throw New Exception '如果沒有新增成功，則丟出一個例外
                '1[查詢]新增的人員id
                command.CommandText = " SELECT 人員.id FROM(人員) WHERE (((人員.身份證字號)=""" & _
                                      IdentificationCardNumTextBox.Text & """));"
                Dim newUserId = command.ExecuteScalar
                '2[新增]E-Mail位址
                command.CommandText = " INSERT INTO 電子郵件 (人員id, 電子郵件) " & _
                                      " VALUES               (" & newUserId & "," & _
                                                            """" & EMailTextBox.Text & """);"
                '3[查詢]電子郵件id
                rowNum = command.ExecuteScalar '執行
                command.CommandText = " SELECT id " & _
                                      " FROM   電子郵件 " & _
                                      " WHERE  人員id=" & newUserId & " AND 電子郵件='" & EMailTextBox.Text & "';"
                Dim newEmailId = command.ExecuteScalar '執行
                '4[新增]角色對應人
                command.CommandText = " INSERT INTO 人員_角色 (人員id) " & _
                                      " VALUES               (" & newUserId & ");"
                rowNum = command.ExecuteNonQuery '執行
                '5[更新]人員的主要電子郵件id
                command.CommandText = " UPDATE 人員 " & _
                                      " SET 人員.主要郵件id = " & newEmailId & _
                                      " WHERE 人員.id=" & newUserId & ";"
                rowNum = command.ExecuteNonQuery '執行
                Transaction.Commit() '確認這次的交易
                resultLabel.Text = "恭喜！您已完成註冊"
                Application("memberCount") += 1
                'Dim sendResult As Boolean = sendEMail(EMailTextBox.Text, Session("pw"), NameTextBox.Text, Application(HeadTag & "hostname"))
            Catch ex As Exception
                Transaction.Rollback() '回搠這次的交易
                resultLabel.Text = "註冊失敗，請洽管理員"
            End Try
            SystemSetting.refreshApplication(Application, "memberCount")
            Application.UnLock()
        End If
    End Sub

    Protected Sub ConfirmInfoCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles ConfirmInfoCustomValidator.ServerValidate
        args.IsValid = ConfirmInformationCheckBox.Checked
    End Sub '[檢查]是否確認輸入資料

    Protected Sub AgreeCustomValidator_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles AgreeCustomValidator.ServerValidate
        args.IsValid = AgreeCheckBox.Checked
    End Sub '[檢查]是否同意本站規定

End Class