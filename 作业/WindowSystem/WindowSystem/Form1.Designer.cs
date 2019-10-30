namespace WindowSystem
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
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btnSystemFirst = new System.Windows.Forms.Button();
            this.btnExitApplication = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(36, 134);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(97, 15);
            this.label1.TabIndex = 0;
            this.label1.Text = "请输入密码：";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(160, 134);
            this.textBox1.Name = "textBox1";
            this.textBox1.PasswordChar = '*';
            this.textBox1.Size = new System.Drawing.Size(255, 25);
            this.textBox1.TabIndex = 1;
            // 
            // btnSystemFirst
            // 
            this.btnSystemFirst.Location = new System.Drawing.Point(55, 316);
            this.btnSystemFirst.Name = "btnSystemFirst";
            this.btnSystemFirst.Size = new System.Drawing.Size(120, 72);
            this.btnSystemFirst.TabIndex = 2;
            this.btnSystemFirst.Text = "确认";
            this.btnSystemFirst.UseVisualStyleBackColor = true;
            this.btnSystemFirst.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnExitApplication
            // 
            this.btnExitApplication.Location = new System.Drawing.Point(242, 316);
            this.btnExitApplication.Name = "btnExitApplication";
            this.btnExitApplication.Size = new System.Drawing.Size(150, 72);
            this.btnExitApplication.TabIndex = 3;
            this.btnExitApplication.Text = "退出";
            this.btnExitApplication.UseVisualStyleBackColor = true;
            this.btnExitApplication.Click += new System.EventHandler(this.button2_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(183, 74);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(15, 15);
            this.label2.TabIndex = 4;
            this.label2.Text = " ";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ControlDarkDark;
            this.ClientSize = new System.Drawing.Size(458, 460);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnExitApplication);
            this.Controls.Add(this.btnSystemFirst);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "System1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button btnSystemFirst;
        private System.Windows.Forms.Button btnExitApplication;
        private System.Windows.Forms.Label label2;
    }
}

