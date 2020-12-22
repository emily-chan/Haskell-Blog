module MyAnimation where

import Animation

-- Olympics Logo

picture :: Animation

picture = (combine
            -- different starting and ending positions
            -- blue circle: starts at (100, 100), ends at (200, 200)
            -- yellow circle: starts at (200, 150), ends at (250, 250)
            -- black circle: starts at (300, 100), ends at (300, 200)
            -- green circle: starts at (400, 150), ends at (350, 250)
            -- red circle: starts at (500, 100), ends at (400, 200)
            [translate (cycleSmooth 8 [(100*fromIntegral i, 100+50*fromIntegral((i+1) `mod` 2)),
                                       (150+50*fromIntegral i, 200+50*fromIntegral((i+1) `mod` 2))])
                -- change scale to 1.1 times the size
                (scale (always (1.1,1.1))
                  -- specify color, opacity, and thickness of circle
                  (withGenBorder (always color) (always 0.75) (always 5)
                    -- make circle into a "ring" like olympics logo
                    -- size of circle smoothly increases at speed of 8 from 0 to 40, then decreases from 40 to 0 and repeats this process
                    (withoutPaint (circle (cycleSmooth 8 [0, 40])))))
            -- list comprehension and zip to match each circle/ring to a specific color
            |  (i, color) <- zip  [1..5] [blue, yellow, black, green, red]])


-- svg file
test :: IO ()
test = writeFile "animation.svg" (svg 800 600 picture)
