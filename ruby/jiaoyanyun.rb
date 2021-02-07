require 'json'

def traverse_kp(knowledge_points, out_file)
  knowledge_points.each do |kp|
    kp['level'] = 0 unless kp['level']
    out_str = "\t" * kp['level'] + kp['name']
    puts out_str
    out_file.puts(out_str)

    next unless kp['childList']

    children = kp['childList']
    level    = kp['level'] + 1

    kp['childList'] = children.map { |child|
      child['level'] = level
      child
    }
    traverse_kp(kp['childList'], out_file)
  end
end

filenames = %w[jiaoyanyun_kp_xx jiaoyanyun_kp_cz jiaoyanyun_kp_gz]

filenames.each_with_index do |filename|
  puts(filename, '=' * 30)
  data_str  = File.read(filename + '.txt')
  data_json = JSON.parse(data_str)

  out_file = File.open(filename + '_out.txt', 'w')
  traverse_kp(data_json['data'], out_file)
  out_file.close
end
