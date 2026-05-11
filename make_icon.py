from PIL import Image, ImageDraw, ImageFont
import math, os

W, H = 512, 512
PRIMARY   = (192, 57,  43)   # #C0392B terracotta
DARK      = (150, 40,  27)   # slightly darker for gradient
ACCENT    = (255, 255, 255)  # white
GOLD      = (241, 196, 15)   # #F1C40F

out_dir = r"f:\Khyber\khyber_mobile\assets\icons"
os.makedirs(out_dir, exist_ok=True)

def make_icon(size):
    img = Image.new("RGBA", (size, size), (0,0,0,0))
    draw = ImageDraw.Draw(img)
    s = size

    # ── Rounded-rect background (gradient simulation via layered rects) ──
    for i in range(s):
        t = i / s
        r = int(PRIMARY[0] + (DARK[0]-PRIMARY[0]) * t)
        g = int(PRIMARY[1] + (DARK[1]-PRIMARY[1]) * t)
        b = int(PRIMARY[2] + (DARK[2]-PRIMARY[2]) * t)
        draw.line([(0, i), (s, i)], fill=(r, g, b, 255))

    # ── Rounded corners mask ──
    radius = int(s * 0.22)
    mask = Image.new("L", (s, s), 0)
    md = ImageDraw.Draw(mask)
    md.rounded_rectangle([0, 0, s-1, s-1], radius=radius, fill=255)
    img.putalpha(mask)

    # ── Mountain silhouette ──
    draw = ImageDraw.Draw(img)
    scale = s / 512

    # Back mountain (slightly translucent white)
    back_mtn = [
        (int(30*scale), int(390*scale)),
        (int(180*scale), int(180*scale)),
        (int(330*scale), int(390*scale)),
    ]
    back_img = Image.new("RGBA", (s, s), (0,0,0,0))
    back_draw = ImageDraw.Draw(back_img)
    back_draw.polygon(back_mtn, fill=(255,255,255,60))
    img = Image.alpha_composite(img, back_img)

    # Front mountain (white)
    draw = ImageDraw.Draw(img)
    front_mtn = [
        (int(140*scale), int(390*scale)),
        (int(290*scale), int(155*scale)),
        (int(440*scale), int(390*scale)),
    ]
    overlay = Image.new("RGBA", (s, s), (0,0,0,0))
    ov_draw = ImageDraw.Draw(overlay)
    ov_draw.polygon(front_mtn, fill=(255,255,255,220))
    img = Image.alpha_composite(img, overlay)

    # Snow cap
    draw = ImageDraw.Draw(img)
    snow = [
        (int(290*scale), int(155*scale)),
        (int(255*scale), int(220*scale)),
        (int(325*scale), int(220*scale)),
    ]
    snow_img = Image.new("RGBA", (s, s), (0,0,0,0))
    sn_draw = ImageDraw.Draw(snow_img)
    sn_draw.polygon(snow, fill=(255,255,255,255))
    img = Image.alpha_composite(img, snow_img)

    # ── "KHYBER" text at bottom ──
    draw = ImageDraw.Draw(img)
    font_size = int(s * 0.115)
    try:
        font = ImageFont.truetype("C:/Windows/Fonts/arialbd.ttf", font_size)
    except:
        font = ImageFont.load_default()

    text = "KHYBER"
    bbox = draw.textbbox((0,0), text, font=font)
    tw = bbox[2] - bbox[0]
    tx = (s - tw) // 2
    ty = int(s * 0.77)
    # Shadow
    draw.text((tx+int(2*scale), ty+int(2*scale)), text, fill=(0,0,0,80), font=font)
    draw.text((tx, ty), text, fill=(255,255,255,255), font=font)

    # ── Gold underline ──
    uy = ty + int(font_size * 1.12)
    uw = int(tw * 0.65)
    ux = (s - uw) // 2
    draw.rectangle([ux, uy, ux+uw, uy+int(3*scale)], fill=GOLD+(255,))

    return img

# Generate 512x512 (Play Store)
icon_512 = make_icon(512)
icon_512.save(os.path.join(out_dir, "icon_512.png"))
print("Saved icon_512.png")

# Generate 1024x500 feature graphic
fg = Image.new("RGBA", (1024, 500), (0,0,0,0))
draw = ImageDraw.Draw(fg)

# Gradient background
for i in range(500):
    t = i / 500
    r = int(PRIMARY[0] + (DARK[0]-PRIMARY[0]) * t)
    g = int(PRIMARY[1] + (DARK[1]-PRIMARY[1]) * t)
    b = int(PRIMARY[2] + (DARK[2]-PRIMARY[2]) * t)
    draw.line([(0, i), (1024, i)], fill=(r, g, b, 255))

# Large mountain on right side
def draw_mountain_fg(img, ox, oy, w, h, alpha):
    mtn = [
        (ox, oy+h),
        (ox+w//2, oy),
        (ox+w, oy+h),
    ]
    ov = Image.new("RGBA", (1024,500), (0,0,0,0))
    d = ImageDraw.Draw(ov)
    d.polygon(mtn, fill=(255,255,255,alpha))
    return Image.alpha_composite(img, ov)

fg = draw_mountain_fg(fg, 580, 60,  380, 380, 55)  # back
fg = draw_mountain_fg(fg, 650, 100, 340, 340, 160) # mid
fg = draw_mountain_fg(fg, 720, 130, 280, 340, 210) # front

# Snow cap on front mountain
sn = Image.new("RGBA", (1024,500), (0,0,0,0))
sn_d = ImageDraw.Draw(sn)
sn_d.polygon([(860,130),(820,210),(900,210)], fill=(255,255,255,255))
fg = Image.alpha_composite(fg, sn)

# Text
draw = ImageDraw.Draw(fg)
try:
    font_big  = ImageFont.truetype("C:/Windows/Fonts/arialbd.ttf", 110)
    font_sub  = ImageFont.truetype("C:/Windows/Fonts/arial.ttf",    42)
except:
    font_big  = ImageFont.load_default()
    font_sub  = font_big

# Shadow + title
draw.text((54, 152), "KHYBER", fill=(0,0,0,80), font=font_big)
draw.text((50, 148), "KHYBER", fill=(255,255,255,255), font=font_big)

# Subtitle
draw.text((54, 282), "KPK City Services", fill=(255,255,255,200), font=font_sub)

# Gold underline
bbox = draw.textbbox((0,0), "KHYBER", font=font_big)
tw = bbox[2] - bbox[0]
draw.rectangle([50, 275, 50 + int(tw*0.55), 279], fill=GOLD+(255,))

fg.save(os.path.join(out_dir, "feature_graphic_1024x500.png"))
print("Saved feature_graphic_1024x500.png")

print("Done.")
