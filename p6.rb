#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "p6"
    end
    body do
      svg do
        defs do
          g :id => "tile" do
            g :id => "triangle",:"stroke-width" => "1" do
              path :fill => "rgb(0,0,0)", :d => "m 353.57143,182.36218 c -37.75388,-1.96069 -5.59994,16.91417 -8.21429,22.14286 -2.27445,4.54891 -14.209,12.88271 -4.64285,16.07143 21.94535,7.31511 7.88556,-24.67128 11.07142,-27.85715 1.92991,-1.9299 12.55798,11.01346 20.35715,3.21429 17.84443,-17.84443 -2.27709,-9.28571 -8.57143,-9.28571 -4.66721,0 1.42857,-9.26136 1.42857,-13.92858 0,-13.24649 23.46077,17.82697 17.14286,-4.28571 -1.14654,-4.01289 2.75824,-10.18498 -0.71429,-12.5 -23.01189,-15.34126 -55.16148,1.39439 -65.35714,21.78571 -2.86569,5.73139 5.10624,12.7509 10.35714,7.5 4.38859,-4.38858 7.99048,-11.56191 12.85714,-16.42857 1.53804,-1.53803 10.39484,-1.17014 12.85715,-1.78571 2.35731,-0.58933 11.44742,15.35714 -0.35715,15.35714"
              path :fill => "rgb(0,0,0)", :d => "m 331.78571,202.00504 c -50.4437,32.43158 11.29875,24.77269 -4.64285,40.71428 -6.52387,6.52388 -26.19816,3.80185 -31.07143,-1.07142 -7.51859,-7.51859 4.63188,-29.2967 2.14286,-31.78572 -1.65675,-1.65675 -4.30133,0.004 -5.71429,0.35714 -16.06377,4.01595 -3.73699,32.06008 -19.28571,24.28572 -3.89758,-1.94879 3.9489,-23.0408 4.64285,-23.21429 7.09001,-1.7725 13.31226,-12.14285 18.92857,-12.14285 4.38527,0 2.36548,16.85297 14.64286,10.71428 3.99066,-1.99533 0.0715,-11.45239 2.14286,-12.14286 7.47676,-2.49225 19.40255,-7.5969 18.21428,4.28572 z"
              path :fill => "rgb(0,0,0)", :d => "m 385,195.21932 c -0.23227,6.45775 2.03376,20 -5,20 -9.38005,0 3.49829,-17.83276 -15.71429,-11.42857 -6.81054,2.27019 8.59794,21.37556 6.42858,25.71429 -2.3656,4.73119 -26.34504,-1.2615 -21.42858,8.57143 0.91906,1.83812 6.07143,-3.12651 6.07143,-1.07143 0,6.64991 18.44489,8.69796 25.35715,1.78571 3.79212,-3.79212 -0.19443,-7.22422 6.07142,-10.35714 7.30547,-3.65273 13.96939,19.2449 27.14286,6.07143 4.41335,-4.41335 -16.86704,-17.77582 -16.07143,-18.57143 1.51934,-1.51934 4.0961,-1.04933 5.35715,-3.57143 6.97706,-13.95413 14.29362,33.56352 25.71428,22.14286 4.22295,-4.22295 -12.26413,-26.90699 -14.28571,-28.92857 -11.52802,-11.52802 -19.68896,3.88247 -22.5,1.07143 -9.45717,-9.45717 12.87513,-17.10688 8.57143,-25.71429 -3.16586,-6.33172 -16.41868,7.24177 -15.71429,14.28571 z"
              path :fill => "rgb(0,0,0)", :d => "m 352.5,125.21932 c -0.7619,15.34443 -25.07128,17.14286 8.92857,17.14286 2.89289,0 6.93552,4.03224 10,2.5 3.98694,-1.99347 -5.50653,-7.08449 -7.5,-11.07143 -2.27354,-4.54708 0.46601,-17.08842 -5.35714,-20 -9.24605,-4.62302 -24.1221,10.87791 -19.64286,15.35715 7.18036,7.18035 10.79453,-16.42461 13.57143,-3.92858 z"
            end
            use :"xlink:href" => "#triangle",:transform => "rotate(60,250,250)"
            use :"xlink:href" => "#triangle",:transform => "rotate(120,250,250)"
            use :"xlink:href" => "#triangle",:transform => "rotate(180,250,250)"
            use :"xlink:href" => "#triangle",:transform => "rotate(240,250,250)"
            use :"xlink:href" => "#triangle",:transform => "rotate(300,250,250)"
          end
        end
        x1, y1 =  0, 346.4102
        x2, y2 = 300, 173.2051
        ((-30)..10).each do |m|
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
