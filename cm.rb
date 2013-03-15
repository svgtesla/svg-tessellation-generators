#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "cm"
    end
    body do
      svg do
        defs do
          g :id => "half" do
            path :fill => "rgb(68,77,97)", :d => "m 74.642857,16.290752 c 17.517898,48.379434 8.703409,-12.9697237 28.928573,-2.857142 9.9767,4.988352 -12.678926,30.892503 -7.142858,36.428571 14.370548,14.370545 14.269008,-18.563075 15.714288,-19.285714 6.8563,-3.42815 5.89457,17.139432 3.92857,21.071428 -1.33663,2.673257 -15.07352,4.2122 -11.78572,7.5 8.1789,8.178894 29.7092,-22.724469 26.42858,-29.285714 -2.5092,-5.018399 -14.54614,-1.592264 -17.14286,-6.785714 -4.56626,-9.132512 22.15778,-6.770791 17.85714,-11.071429 C 118.00302,-1.4205134 84.221527,7.2755338 74.642857,16.290752 z"
            path :fill => "rgb(108,108,84)", :d => "M 137.85714,5.2193238 C 154.12735,0.88918497 142.05651,24.640434 144.64286,25.93361 161.41584,34.320102 151.27057,12.520186 155,8.7907524 c 5.10449,-5.1044921 26.17592,0.104492 21.07143,-5 -4.34435,-4.34434914 -20.0777,4.0682912 -25.35714,1.4285714 -3.83326,-1.9166297 -8.66925,-0.9104127 -12.85715,0 z"
            path :fill => "rgb(110,88,69)", :d => "M 50.714286,5.5764667 C 47.024946,4.7009409 21.04422,0.06399786 30,12.005038 c 2.873896,3.831862 13.288815,1.465836 17.5,3.571429 3.722907,1.861453 0.967805,14.133048 7.5,12.5 3.972361,-0.99309 7.215461,-14.497649 8.571429,-11.785715 1.91015,3.820301 2.178741,49.249831 15.357143,36.071429 C 80.307167,50.983586 71.968005,4.6523919 50.714286,5.5764667 z"
          end
          g :id => "tile" do
            use :"xlink:href" => "#half"
            use :"xlink:href" => "#half", :transform => "matrix(1,0,0,-1,0,0)"
          end
        end
        x1, y1 =  100,80
        x2, y2 = 100, -80
        ((-10)..15).each do |m|
          ((-10)..10).each do |n|
            x_delta = m*x1 + n*x2
            y_delta = m*y1 + n*y2
            use :"xlink:href" => "#tile",:transform => "translate(#{x_delta},#{y_delta})"
          end
        end
      end
    end
  end

end

out = File.new('output.html','w')
out.puts html.doc.to_html
out.close
