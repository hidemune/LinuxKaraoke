/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jtag;

import com.coremedia.iso.IsoFile;
import com.coremedia.iso.boxes.Container;
import com.googlecode.mp4parser.BasicContainer;
import com.googlecode.mp4parser.FileDataSourceImpl;
import com.googlecode.mp4parser.authoring.Movie;
import com.googlecode.mp4parser.authoring.builder.DefaultMp4Builder;
import com.googlecode.mp4parser.authoring.tracks.AACTrackImpl;
import com.googlecode.mp4parser.authoring.tracks.H264TrackImpl;
import java.io.File;
import java.util.List;
import org.jaudiotagger.audio.AudioFile;
import org.jaudiotagger.audio.AudioFileIO;
import org.jaudiotagger.audio.AudioHeader;
import org.jaudiotagger.tag.FieldKey;
import org.jaudiotagger.tag.Tag;

/**
 *
 * @author hdm
 */
public class Jtag {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        if (args.length != 1) {
            System.err.println("ファイル名を１つ渡してやるざます");
            System.exit(255);
        }
        AudioFile f;
        
        try {
            f = AudioFileIO.read(new File(args[0]));
            Tag tag = f.getTag();
            
            AudioHeader ah = f.getAudioHeader();
            String at = tag.getFirst(FieldKey.ARTIST);
            String al = tag.getFirst(FieldKey.ALBUM);
            String tt = tag.getFirst(FieldKey.TITLE);
            String uni = at + al + tt;
            
            byte[] b1 = at.getBytes("8859_1");
            String at2 = new String(b1, "shift_jis");
            byte[] b2 = al.getBytes("8859_1");
            String al2 = new String(b2, "shift_jis");
            byte[] b3 = tt.getBytes("8859_1");
            String tt2 = new String(b3, "shift_jis");
            String sji = at2 + al2 + tt2;

            /*
            System.out.println(String.format("byte型 byteValue (16進数表示):%X", b1[0]));
            System.out.println(String.format("byte型 byteValue (16進数表示):%X", b1[1]));
            System.out.println(String.format("byte型 byteValue (16進数表示):%X", b1[2]));
            */
            
            String at3 = new String(b1, "UTF8");
            String al3 = new String(b2, "UTF8");
            String tt3 = new String(b3, "UTF8");
            String un8 = at3 + al3 + tt3;
            
            boolean utf8 = false;
            boolean sjis = false;
            if (at.length() > at2.length()) {
                sjis = true;
            }
            if (al.length() > al2.length()) {
                sjis = true;
            }
            if (tt.length() > tt2.length()) {
                sjis = true;
            }
            if (sjis) {
                if (at2.length() > at3.length()) {
                    utf8 = true;
                }
                if (al2.length() > al3.length()) {
                    utf8 = true;
                }
                if (tt2.length() > tt3.length()) {
                    utf8 = true;
                }
            } else {
                if (at.length() > at3.length()) {
                    utf8 = true;
                }
                if (al.length() > al3.length()) {
                    utf8 = true;
                }
                if (tt.length() > tt3.length()) {
                    utf8 = true;
                }
            }
            
            if (un8.indexOf("�̨") >= 0) {
                utf8 = false;
            }
            if (sji.indexOf("�̨") >= 0) {
                sjis = false;
            }
            
            
            if (utf8) {
                System.out.print(args[0]);
                System.out.print("\t");
                System.out.print(at3);
                System.out.print("\t");
                System.out.print(al3);
                System.out.print("\t");
                System.out.println(tt3);
            } else if (sjis) {
                System.out.print(args[0]);
                System.out.print("\t");
                System.out.print(at2);
                System.out.print("\t");
                System.out.print(al2);
                System.out.print("\t");
                System.out.println(tt2);
            } else {
                System.out.print(args[0]);
                System.out.print("\t");
                System.out.print(at);
                System.out.print("\t");
                System.out.print(al);
                System.out.print("\t");
                System.out.println(tt);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            tryMp4(args);
        }
    }
    public static void tryMp4(String[] args) {
        
        try{
            String str[] = args[0].split("/");
            System.out.print(args[0]);
            System.out.print("\t");
            System.out.print("");
            System.out.print("\t");
            System.out.print("");
            System.out.print("\t");
            String tt = str[str.length-1];
            tt = tt.replace(".m4v", "");
            tt = tt.replace(".mp4", "");
            tt = tt.replace(".mpeg4", "");
            System.out.println(tt);
        }catch (Exception e) {
            e.printStackTrace();
        }
        
    }
}
