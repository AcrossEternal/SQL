namespace Window1
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.btnShowFirstForm = new System.Windows.Forms.Button();
            this.btnExitApplication = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnShowFirstForm
            // 
            this.btnShowFirstForm.Location = new System.Drawing.Point(33, 171);
            this.btnShowFirstForm.Name = "btnShowFirstForm";
            this.btnShowFirstForm.Size = new System.Drawing.Size(106, 79);
            this.btnShowFirstForm.TabIndex = 0;
            this.btnShowFirstForm.Text = "切换第二个";
            this.btnShowFirstForm.UseVisualStyleBackColor = true;
            this.btnShowFirstForm.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnExitApplication
            // 
            this.btnExitApplication.Location = new System.Drawing.Point(170, 175);
            this.btnExitApplication.Name = "btnExitApplication";
            this.btnExitApplication.Size = new System.Drawing.Size(91, 74);
            this.btnExitApplication.TabIndex = 1;
            this.btnExitApplication.Text = "退出";
            this.btnExitApplication.UseVisualStyleBackColor = true;
            this.btnExitApplication.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.btnExitApplication);
            this.Controls.Add(this.btnShowFirstForm);
            this.Name = "Form1";
            this.Text = "第一个窗口";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnShowFirstForm;
        private System.Windows.Forms.Button btnExitApplication;
    }
}

