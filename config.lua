application = {--fichier de configuration de l'application
	content = {
		width = 320,
		height = 480, 
		scale = "letterBox",
		fps = 30,
		--imageSuffix = { -- goh
        --    ["@6x"]=1, --ios 1, -- android 1,-- @6x --2, --3, --2, --1
        --    ["@4x"]=2.2 --ios 4 -- android 2.2,--@4x --1
        --}
         imageSuffix = { -- not goh
             ["@4x"]=2.2,--2, --3, --2, --1
		     ["@4x"]=1, --1
             ["@4x"]=10, --2 --3 --3
             ["@4x"]=1
		}
	},

      --  {
          -- showRuntimeErrors = false,
        --}
    
    -- Push notifications

    -- notification =
    -- {
    --     iphone =
    --     {
    --         types =
    --         {
    --             "badge", "sound", "alert", "newsstand"
    --         }
    --     }
    -- }
    --
    license = {
        google = {
            key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtQMyWqBGtxQ0vYzAvA2HLu6MCrKYOMOLED1Jxn05vENDAEdKutdULSbFGSRPKepiBpedMCryxkzQMP2pBjE3IxNc7fWzqH0KSehC8LotuHSUmiFJbW1J+zUNFYuDzXvOdtPTaD9O3e2pcczGeG33beLjn2zCRGOBppae8niwxFqUz6/TgficJqFqFbdKjt15YpC/X6rUpwy0gAlh/gXelrwkUeSKlmXsySAL0+RDqDn0OirWb88xIH4trl2GcFIzN2ZIcpwaBuDNpvD/18TRGiRZqezZZP4pYZw82nL52wlQvXJBtgcIk1ujUbc+PJlTYYw1+cHI7hL8I8gylVsnZQIDAQAB",
            --key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh0E066QTHeO3rpJiHf8YS4cnv0aHXmEThnV5BN+FfqLMHUfMFcfkkXTXvu+1a2r1UiqpCGzr8BKXCI92Ps2yyqBef85yxk9td0crhszfY5qZjijtAjUIIhhi7J8GdBsgaTKVbNVh1RpBm0O7AcimSyM5wFSavejOnKzlTmtWYClg9XVyXfZO6xbWEY7pBc2VPPY0C+IogqmlIe6hCeHERA1UdpUk9gwsbSiG648a1Pn6lrGn/Pt6u3jlHXsexryRuhGOBXx+xOXfV4XMbAwZlAIwo1RSH4ZcmBCZ+PwmJzDVJ/kwFbq5vVD7c0RSeFGWWlpBMTdiiV5MaR+Tl9haTwIDAQAB",
            --key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjSS+O5OjIDZzD80SdO9W0PC8Eqf3sVlwC3ZCpke5LScQ6jgaevOa9xme9OxZd9n15GHED8kYeomwWYRmHTQsVkBe//iErz0zsujcOd6THBmcxzRS5Bssdj+zLS6gBWqsWApQjQmQ7VWyMG8oDD6Smhext1Fa8go3LtMds8LPj7MITqMOnf0YiwhjKfFWObViiJ5FhKYXtdW3SNEgjdANAhBiD7SemgamkRfAfEy+JeilZycfUFknfhFbgP+ldA8NADdlAoQZdXVtjnWavhWxFniTYHfWwGDAVTAidT2pZPL6bZgHb3lT34RfeMwbX47eTV+7OTv0Y8+6u16J/ht9xwIDAQAB", --gohp
        },
    },  
}
 --   print("config.lua set on "..application.content.imageSuffix["@6x"])



-- nouvelle version de config.lua
-- local w, h = display.pixelWidth, display.pixelHeight

-- local modes = {1, 1.5, 2, 2.5, 3, 4, 5, 6, 7, 8} -- Scaling factors to try
-- local contentW, contentH = 320, 480   -- Minimal size your content can fit in

-- -- Try each mode and find the best one
-- local _w, _h, _m = w, h, 1
-- for i = 1, #modes do
--     local m = modes[i]
--     local lw, lh = w / m, h / m
--     if lw < contentW or lh < contentH then
--         break
--     else
--         _w, _h, _m = lw, lh, m
--     end
-- end
-- -- If scaling is not pixel perfect (between 1 and 2) - use letterbox
-- if _m < 2 then
--     local scale = math.max(contentW / w, contentH / h)
--     _w, _h = w * scale, h * scale
-- end

-- application = {
--     content = {
--         width = _w,
--         height = _h,
--         scale = 'letterbox',
--         fps = 60,
--         imageSuffix = {
--             ['@4x'] = 1.1,
--             ['@4x'] = 2.1,
--         }
--     },
--     license = {
--         google = {
--             key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtQMyWqBGtxQ0vYzAvA2HLu6MCrKYOMOLED1Jxn05vENDAEdKutdULSbFGSRPKepiBpedMCryxkzQMP2pBjE3IxNc7fWzqH0KSehC8LotuHSUmiFJbW1J+zUNFYuDzXvOdtPTaD9O3e2pcczGeG33beLjn2zCRGOBppae8niwxFqUz6/TgficJqFqFbdKjt15YpC/X6rUpwy0gAlh/gXelrwkUeSKlmXsySAL0+RDqDn0OirWb88xIH4trl2GcFIzN2ZIcpwaBuDNpvD/18TRGiRZqezZZP4pYZw82nL52wlQvXJBtgcIk1ujUbc+PJlTYYw1+cHI7hL8I8gylVsnZQIDAQAB",
--         },
--     },  
-- }

-- version 3
--calculate the aspect ratio of the device
-- local aspectRatio = display.pixelHeight / display.pixelWidth
-- application = {--fichier de configuration de l'application
--  content = {
--      width =aspectRatio > 2 and 320 or math.floor( 640 / aspectRatio ) ,
--      height =aspectRatio < 2 and 480 or math.floor( 960 * aspectRatio ) ,
--      scale = "letterBox",
--      fps = 30,
        
--         imageSuffix = { -- mettre ici en commentaire
--             --["@6x"]=2,--2, --3, --2, --1
--          --["@8x"]=1, --1
--             ["@4x"]=30, --2 --3 --3
--             ["@4x"]=-1
--      }
--  },

      --  {
          -- showRuntimeErrors = false,
        --}
    
    -- Push notifications

    -- notification =
    -- {
    --     iphone =
    --     {
    --         types =
    --         {
    --             "badge", "sound", "alert", "newsstand"
    --         }
    --     }
    -- }
    --
--     license = {
--         google = {
--             key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtQMyWqBGtxQ0vYzAvA2HLu6MCrKYOMOLED1Jxn05vENDAEdKutdULSbFGSRPKepiBpedMCryxkzQMP2pBjE3IxNc7fWzqH0KSehC8LotuHSUmiFJbW1J+zUNFYuDzXvOdtPTaD9O3e2pcczGeG33beLjn2zCRGOBppae8niwxFqUz6/TgficJqFqFbdKjt15YpC/X6rUpwy0gAlh/gXelrwkUeSKlmXsySAL0+RDqDn0OirWb88xIH4trl2GcFIzN2ZIcpwaBuDNpvD/18TRGiRZqezZZP4pYZw82nL52wlQvXJBtgcIk1ujUbc+PJlTYYw1+cHI7hL8I8gylVsnZQIDAQAB",
--         },
--     },  
-- }
-- application = {
--     content = {
--         width = 800, --aspectRatio > 1.5 and 800 or math.floor( 1200 / aspectRatio ) ,
--         height = 1200, --aspectRatio < 1.5 and 1200 or math.floor( 800 * aspectRatio ) ,
--         scale = 'letterbox',
--         fps = 30,
--         imageSuffix = {
--             ['@4x'] = 1.1,
--             ['@4x'] = 2.1,
--         },
--     },
--     license = {
--         google = {
--             key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtQMyWqBGtxQ0vYzAvA2HLu6MCrKYOMOLED1Jxn05vENDAEdKutdULSbFGSRPKepiBpedMCryxkzQMP2pBjE3IxNc7fWzqH0KSehC8LotuHSUmiFJbW1J+zUNFYuDzXvOdtPTaD9O3e2pcczGeG33beLjn2zCRGOBppae8niwxFqUz6/TgficJqFqFbdKjt15YpC/X6rUpwy0gAlh/gXelrwkUeSKlmXsySAL0+RDqDn0OirWb88xIH4trl2GcFIzN2ZIcpwaBuDNpvD/18TRGiRZqezZZP4pYZw82nL52wlQvXJBtgcIk1ujUbc+PJlTYYw1+cHI7hL8I8gylVsnZQIDAQAB",
--         },
--     },  
-- }