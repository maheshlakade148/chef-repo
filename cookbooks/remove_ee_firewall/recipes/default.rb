# firewall
    list1 = ['remove-service=dns', 'add-service=ssh', 'remove-port=3000/tcp', 'remove-masquerade']
    list1.each do|l|
 
    execute "list1" do
    command "firewall-cmd --permanent --#{l}"
    action :run
    end
    end
 

     list2 = ['add-service=ssh', 'remove-port=3000/tcp', 'remove-masquerade']
     list2.each do|l|

     execute "list2" do
     command "firewall-cmd --permanent --#{l} --zone=external"
     action :run
     end
     end


 h1 = {"4000" => "192.168.1.66", "50180" => "192.168.1.46", "8443" => "192.168.1.38", "2222" => "192.168.1.15", "8484" => "192.168.1.38", "8888" => "192.168.1.38", "9999" => "192.168.1.38", "16000" => "192.168.1.72", "9090" => "192.168.1.15"}
h1.each do |p, ip|

      execute "h1" do
      command "firewall-cmd --permanent --remove-forward-port=port=#{p}:proto=tcp:toport=#{p}:toaddr=#{ip} --zone=external"
      action :run
      end
      end


      hremain = {"2201" => "22", "80" => "8080"}
      hremain.each do |p1, p2|
      execute "hremain" do
      command "firewall-cmd --permanent --remove-forward-port=port=#{p1}:proto=tcp:toport=#{p2}:toaddr=192.168.1.110 --zone=external"
      action :run
      end
      end
     
  

#prerouting
h2 = {"9080" => "192.168.1.15", "4000" => "192.168.1.66", "50180" => "192.168.1.46", "8443" => "192.168.1.38", "2222" => "192.168.1.15", "8484" => "192.168.1.38", "8888" => "192.168.1.38", "9999" => "192.168.1.38", "16000" => "192.168.1.72", "9090" => "192.168.1.15"}
   h2.each do |p, ip|

   execute "h2" do
   command "firewall-cmd --permanent --direct --remove-rule ipv4 nat PREROUTING 0 -p tcp --dport #{p} -d 49.248.27.91 -j DNAT --to-destination #{ip}:#{p}"
   action :run
   end
   end

#postrouting
h3 = {"9080" => "192.168.1.15", "4000" => "192.168.1.66", "50180" => "192.168.1.46", "8443" => "192.168.1.38", "2222" => "192.168.1.15", "8484" => "192.168.1.38", "8888" => "192.168.1.38", "9999" => "192.168.1.38", "16000" => "192.168.1.72", "9090" => "192.168.1.15"}
h3.each do |p, ip|

  execute "h3" do
  command "firewall-cmd --permanent --direct --remove-rule ipv4 nat POSTROUTING 0 -p tcp --dport #{p} -s 192.168.1.0/24 -d #{ip} -j SNAT --to-source 192.168.1.5"
  action :run
      end
      end

#Remain prerouting
h4 = {"9090" => "192.168.1.15"}
h4.each do |p, ip|

   execute "h4" do
   command "firewall-cmd --permanent --direct --remove-rule ipv4 nat PREROUTING 0 -p tcp --dport #{p} -d 49.248.27.91 -j DNAT --to-destination #{ip}:#{p}"
   action :run
   end
   end
   
hremainpre = {"80" => "8080", "2201" => "22"}
hremainpre.each do |p1, p2|
execute "hremainpre" do
command "firewall-cmd --permanent --direct --remove-rule ipv4 nat PREROUTING 0 -p tcp --dport #{p1} -d 49.248.27.91 -j DNAT --to-destination 192.168.1.110:#{p2}"
          action :run
          end
          end

hremainpost = {"8080" => "80", "22" => "2201"}
hremainpost.each do |p1, p2|
  execute "hremainpost" do
  command "firewall-cmd --permanent --direct --remove-rule ipv4 nat POSTROUTING 0 -p tcp --dport #{p1} -s 192.168.1.0/24 -d 192.168.1.110 -j SNAT --to-source 192.168.1.5"
  action :run
  end
  end

   execute "reload" do
   command "firewall-cmd --complete-reload"
   action :run
   end
      
