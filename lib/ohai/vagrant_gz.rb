Ohai.plugin(:GzVagrant) do
  provides 'vagrant'
  depends 'etc/passwd', 'virtualization/system'

  collect_data(:linux) do
    if virtualization["system"] == "vbox"
      vagrant Mash.new if vagrant etc["passwd"].any? { |k,v| k == "vagrant"}
    end
  end
end
