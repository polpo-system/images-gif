MODULE GIFImagesTest;  (** GIFImagesTest.Run: an image file of the format written and loaded with Images; needs the desktop's display *)

IMPORT Files, Images, Modules, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR f: Files.File; R: Files.Rider; img: Images.Image; done: BOOLEAN;
BEGIN
  fails := 0; checks := 0;
  Check("GIFImages", Modules.ThisMod("GIFImages") # NIL);
  f := Files.New("zq_test.gif"); Files.Set(R, f, 0);
   Files.Write(R, 47X); Files.Write(R, 49X); Files.Write(R, 46X); Files.Write(R, 38X); Files.Write(R, 39X); Files.Write(R, 61X);
   Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 80X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 0FFX); Files.Write(R, 0FFX);
   Files.Write(R, 0FFX); Files.Write(R, 21X); Files.Write(R, 0F9X); Files.Write(R, 04X); Files.Write(R, 01X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 2CX); Files.Write(R, 00X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X); Files.Write(R, 01X); Files.Write(R, 00X);
   Files.Write(R, 00X); Files.Write(R, 02X); Files.Write(R, 02X); Files.Write(R, 44X); Files.Write(R, 01X); Files.Write(R, 00X);
   Files.Write(R, 3BX);
  Files.Register(f);
  NEW(img); Images.Load(img, "zq_test.gif", done);
  Check("zq_test.gif loaded, 1 by 1", done & (img.width = 1) & (img.height = 1));
  Out.String("GIFImagesTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END GIFImagesTest.
