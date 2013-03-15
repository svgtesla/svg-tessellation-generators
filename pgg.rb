#!/usr/bin/env ruby

require 'nokogiri'

require 'pry'

html = Nokogiri::XML::Builder.new do 

  html do
    head do
      title "pgg"
    end
    body do
      svg do
        defs do
          g :id => "fourth" do
            path :fill => "rgb(161,17,53)", :d => "m 58.571429,112.00504 c -12.323875,2.77922 -39.962635,-6.82308 -50.0000004,3.21429 -16.1500198,16.15002 31.8859834,7.75687 27.1428574,12.5 -3.726101,3.7261 -12.527185,0.15101 -16.785715,1.42857 -6.136051,1.84081 -3.823755,11.48098 0.357143,13.57143 C 23.110905,144.63192 45,132.97983 45,137.00504 c 0,4.75822 -18.725638,25.76569 5,17.85714 18.031823,-6.01061 -5,-18.32957 -5,-26.07143 0,-12.08057 20.130703,10.67072 24.285714,9.28572 C 77.292866,135.40742 67.143752,126.647 70,123.79075 c 0.556299,-0.5563 6.626898,0.46824 7.857143,0.71429 20.730835,4.14617 2.5,7.60869 2.5,13.57143 0,1.7322 12.055163,1.51626 13.214286,0.35714 18.087281,-18.08728 -9.098868,-15.1703 -17.5,-23.57143 -14.424921,-14.42492 2.051861,-38.779189 -24.285715,-29.999997 -14.637488,4.879162 32.22794,29.263047 6.785715,27.142857 z"
            path :fill => "rgb(197,107,35)", :d => "M 14.642857,85.576468 C 19.699329,83.623302 45.339243,98.451511 45,98.790754 39.879356,103.9114 24.765082,94.025672 20.714286,98.076468 c -2.473077,2.473072 11.071428,3.422282 11.071428,5.000002 0,0.72959 -16.904786,0.65475 -18.928571,-0.35714 -5.0119851,-2.506 -9.3966927,-19.539092 1.785714,-17.142862 z"
            path :fill => "rgb(163,47,117)", :d => "m 106.78571,89.50504 c -5.07766,-2.243412 -10.976666,-1.493129 -16.428567,-0.714286 -26.43448,3.776354 5.565033,9.136462 6.785714,10.357143 3.792653,3.792653 -15.232287,3.106853 -10.714286,12.142853 3.214958,6.42992 19.675119,4.98388 23.928569,2.85715 13.06475,-6.53238 -1.99073,-19.900783 -3.57143,-24.64286 z"
            path :fill => "rgb(220,151,161)", :d => "m 101.07143,147.00504 c -5.545558,-3.67053 -39.752757,-1.64837 -37.142859,3.57143 0.360874,0.72175 47.516639,5.32387 49.285719,1.78571 2.06718,-4.13437 -4.26862,-21.80282 -8.21429,-17.85714 -6.706387,6.70639 11.97208,15.15011 -3.92857,12.5 z"
          end
          g :id => "half" do
            use :"xlink:href" => "#fourth"
            use :"xlink:href" => "#fourth", :transform => "translate(0,120) matrix(1,0,0,-1,0,0) translate(120,-120)"
          end
          g :id => "tile" do
            use :"xlink:href" => "#half"
            use :"xlink:href" => "#half", :transform => "rotate(180,120,80)"
          end
        end
        x1, y1 = 240,0
        x2, y2 =  0,160
        ((0)..50).each do |m|
          ((0)..80).each do |n|
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
