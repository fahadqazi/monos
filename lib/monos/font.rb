module Monos
  class Font
    def initialize(spacing = 6, pixel_size = Monos::PIXEL_SIZE)
      @spacing = spacing
      @pixel_size = pixel_size

      @chars = {}
      
      # Do upper case alphabet
      i = 65
      (Monos.tiles[5][0..15] + Monos.tiles[6][0..9]).each do |img|
        @chars[i] = img
        i += 1
      end
      
      # Do numbers
      i = 48
      Monos.tiles[7][0..10].each do |img|
        @chars[i] = img
        i += 1
      end
      
      @chars["."[0]] = Monos.tiles[6][10]
      @chars["!"[0]] = Monos.tiles[6][12]
      @chars["?"[0]] = Monos.tiles[6][13]
      @chars["a"[0]] = Monos.tiles[1][0]
      @chars["h"[0]] = Monos.tiles[4][0]      
      

      @chars["g"[0]] = Monos.tiles[4][7]
      @chars["j"[0]] = Monos.tiles[4][1]      
      @chars["k"[0]] = Monos.tiles[4][2]      
      @chars["l"[0]] = Monos.tiles[4][3]      
      @chars["m"[0]] = Monos.tiles[4][5]

      @chars["t"[0]] = Monos.tiles[3][2]
      @chars["x"[0]] = Monos.tiles[9][0]
    end
    
    def draw_string(str, x, y)
      cur_x, cur_y = x, y
      
      # WARNING: Reverting to 1.8-style
      str.each_byte do |chr|
        sprite = nil
        
        if chr == 10    # newline
          cur_y += 10 * @pixel_size
          cur_x = x
        elsif chr == 32 # space
          cur_x += @spacing * @pixel_size
        elsif chr == 95 # thin space
          cur_x += (@spacing * @pixel_size) / 2
        end
        
        if @chars[chr]
          meth = :draw
          spacing = @spacing + 2
          
          if (65..90) === chr || "."[0] == chr || "!"[0] == chr || (48..57) === chr
            spacing = @spacing
            meth = :draw_flash
            spacing += 1 if (48..57) === chr
          end
          
          @chars[chr].send(meth, cur_x, cur_y, (@pixel_size * 8), (@pixel_size * 8))
          cur_x += spacing * @pixel_size
        end
      end
    end
  end
end