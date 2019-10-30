namespace SQLExcel1
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
            this.btnCount1 = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.btnExecuteCommand = new System.Windows.Forms.Button();
            this.btnGetOneValue = new System.Windows.Forms.Button();
            this.btnGetValues = new System.Windows.Forms.Button();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.btnUseDataset = new System.Windows.Forms.Button();
            this.btnBookStoreProc1 = new System.Windows.Forms.Button();
            this.btnBookStoreProc2 = new System.Windows.Forms.Button();
            this.txtBookID = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // btnCount1
            // 
            this.btnCount1.Location = new System.Drawing.Point(65, 616);
            this.btnCount1.Name = "btnCount1";
            this.btnCount1.Size = new System.Drawing.Size(96, 59);
            this.btnCount1.TabIndex = 0;
            this.btnCount1.Text = "测试连接！";
            this.btnCount1.UseVisualStyleBackColor = true;
            this.btnCount1.Click += new System.EventHandler(this.btnCount1_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(63, 57);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 12);
            this.label1.TabIndex = 1;
            this.label1.Text = "准备链接数据库";
            // 
            // btnExecuteCommand
            // 
            this.btnExecuteCommand.Location = new System.Drawing.Point(197, 616);
            this.btnExecuteCommand.Name = "btnExecuteCommand";
            this.btnExecuteCommand.Size = new System.Drawing.Size(80, 59);
            this.btnExecuteCommand.TabIndex = 2;
            this.btnExecuteCommand.Text = "一键修改";
            this.btnExecuteCommand.UseVisualStyleBackColor = true;
            this.btnExecuteCommand.Click += new System.EventHandler(this.btnExecuteCommand_Click);
            // 
            // btnGetOneValue
            // 
            this.btnGetOneValue.Location = new System.Drawing.Point(293, 616);
            this.btnGetOneValue.Name = "btnGetOneValue";
            this.btnGetOneValue.Size = new System.Drawing.Size(76, 58);
            this.btnGetOneValue.TabIndex = 3;
            this.btnGetOneValue.Text = "查找一项";
            this.btnGetOneValue.UseVisualStyleBackColor = true;
            this.btnGetOneValue.Click += new System.EventHandler(this.btnSlect_Click);
            // 
            // btnGetValues
            // 
            this.btnGetValues.Location = new System.Drawing.Point(393, 616);
            this.btnGetValues.Name = "btnGetValues";
            this.btnGetValues.Size = new System.Drawing.Size(87, 59);
            this.btnGetValues.TabIndex = 4;
            this.btnGetValues.Text = "查找多项";
            this.btnGetValues.UseVisualStyleBackColor = true;
            this.btnGetValues.Click += new System.EventHandler(this.btnGetValues_Click);
            // 
            // dataGridView
            // 
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Location = new System.Drawing.Point(100, 72);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.RowTemplate.Height = 23;
            this.dataGridView.Size = new System.Drawing.Size(880, 436);
            this.dataGridView.TabIndex = 5;
            // 
            // btnUseDataset
            // 
            this.btnUseDataset.Location = new System.Drawing.Point(513, 616);
            this.btnUseDataset.Name = "btnUseDataset";
            this.btnUseDataset.Size = new System.Drawing.Size(93, 59);
            this.btnUseDataset.TabIndex = 6;
            this.btnUseDataset.Text = "图书信息启动！";
            this.btnUseDataset.UseVisualStyleBackColor = true;
            this.btnUseDataset.Click += new System.EventHandler(this.btnUseDataset_Click);
            // 
            // btnBookStoreProc1
            // 
            this.btnBookStoreProc1.Location = new System.Drawing.Point(635, 619);
            this.btnBookStoreProc1.Name = "btnBookStoreProc1";
            this.btnBookStoreProc1.Size = new System.Drawing.Size(97, 54);
            this.btnBookStoreProc1.TabIndex = 7;
            this.btnBookStoreProc1.Text = "查找图书信息";
            this.btnBookStoreProc1.UseVisualStyleBackColor = true;
            this.btnBookStoreProc1.Click += new System.EventHandler(this.btnBookStoreProc1_Click);
            // 
            // btnBookStoreProc2
            // 
            this.btnBookStoreProc2.Location = new System.Drawing.Point(513, 534);
            this.btnBookStoreProc2.Name = "btnBookStoreProc2";
            this.btnBookStoreProc2.Size = new System.Drawing.Size(109, 50);
            this.btnBookStoreProc2.TabIndex = 8;
            this.btnBookStoreProc2.Text = "按图书编号查找";
            this.btnBookStoreProc2.UseVisualStyleBackColor = true;
            this.btnBookStoreProc2.Click += new System.EventHandler(this.btnBookStoreProc2_Click);
            // 
            // txtBookID
            // 
            this.txtBookID.Location = new System.Drawing.Point(380, 554);
            this.txtBookID.Name = "txtBookID";
            this.txtBookID.Size = new System.Drawing.Size(100, 21);
            this.txtBookID.TabIndex = 9;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(273, 563);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(101, 12);
            this.label2.TabIndex = 10;
            this.label2.Text = "按照图书编号查找";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1293, 725);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtBookID);
            this.Controls.Add(this.btnBookStoreProc2);
            this.Controls.Add(this.btnBookStoreProc1);
            this.Controls.Add(this.btnUseDataset);
            this.Controls.Add(this.dataGridView);
            this.Controls.Add(this.btnGetValues);
            this.Controls.Add(this.btnGetOneValue);
            this.Controls.Add(this.btnExecuteCommand);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnCount1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnCount1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnExecuteCommand;
        private System.Windows.Forms.Button btnGetOneValue;
        private System.Windows.Forms.Button btnGetValues;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.Button btnUseDataset;
        private System.Windows.Forms.Button btnBookStoreProc1;
        private System.Windows.Forms.Button btnBookStoreProc2;
        private System.Windows.Forms.TextBox txtBookID;
        private System.Windows.Forms.Label label2;
    }
}

