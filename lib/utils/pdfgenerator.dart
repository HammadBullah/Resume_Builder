import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';
import 'resume_provider.dart';

Future<void> generateResumePdf(BuildContext context) async {
  final provider = Provider.of<ResumeProvider>(context, listen: false);

  final pdf = pw.Document();

  final poppinsRegular = await PdfGoogleFonts.poppinsRegular();
  final poppinsBold = await PdfGoogleFonts.poppinsBold();
  final poppinsItalic = await PdfGoogleFonts.poppinsItalic();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              width: 200,
              color: PdfColors.grey300,
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(16.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    if (provider.photo != null)
                      pw.Container(
                        width: 100,
                        height: 100,
                        decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          image: pw.DecorationImage(
                            image: pw.MemoryImage(
                              provider.photo!,
                            ),
                            fit: pw.BoxFit.cover,
                          ),
                        ),
                      ),
                    pw.SizedBox(height: 20),
                    pw.Text('Contact', style: pw.TextStyle(font: poppinsBold, fontSize: 14)),
                    pw.Text('Phone: ${provider.phone}', style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                    pw.Text('Email: ${provider.email}', style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                    pw.Text('Address: ${provider.address}', style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                    pw.SizedBox(height: 20),
                    pw.Text('Education', style: pw.TextStyle(font: poppinsBold, fontSize: 14)),
                    for (var education in provider.educationList)
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(bottom: 8.0),
                        child: pw.Text(
                          '${education.course}\n${education.school}, ${education.yearEnded}',
                          style: pw.TextStyle(font: poppinsRegular, fontSize: 12),
                        ),
                      ),
                    pw.SizedBox(height: 20),
                    pw.Text('Skills', style: pw.TextStyle(font: poppinsBold, fontSize: 14)),
                    for (var skill in provider.skills)
                      pw.Text(skill, style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                    pw.SizedBox(height: 20),
                    pw.Text('Languages', style: pw.TextStyle(font: poppinsBold, fontSize: 14)),
                    for (var language in provider.languages)
                      pw.Text(language, style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                  ],
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Padding(
                padding: const pw.EdgeInsets.all(16.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(provider.name, style: pw.TextStyle(font: poppinsBold, fontSize: 24)),
                    pw.Text(provider.title, style: pw.TextStyle(font: poppinsRegular, fontSize: 18)),
                    pw.SizedBox(height: 10),
                    pw.Text(provider.summary, style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                    pw.SizedBox(height: 20),
                    pw.Text('Experience', style: pw.TextStyle(font: poppinsBold, fontSize: 18)),
                    for (var experience in provider.experienceList)
                      pw.Container(
                        margin: const pw.EdgeInsets.only(bottom: 10),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(experience.jobName, style: pw.TextStyle(font: poppinsBold, fontSize: 14)),
                            pw.Text(
                              '${experience.startDate} - ${experience.endDate}',
                              style: pw.TextStyle(font: poppinsItalic, fontSize: 12),
                            ),
                            pw.Text(experience.summary, style: pw.TextStyle(font: poppinsRegular, fontSize: 12)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
}
