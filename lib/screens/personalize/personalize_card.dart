import 'package:arovita/utils/responsive.dart';
import 'package:flutter/material.dart';

class PersonalizeCard extends StatefulWidget {
  const PersonalizeCard({super.key});

  @override
  State<PersonalizeCard> createState() => _PersonalizeCardState();
}

class _PersonalizeCardState extends State<PersonalizeCard> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtl = TextEditingController();
  final TextEditingController _dobCtl = TextEditingController();

  String _gender = '';
  String? _errorMessage;

  @override
  void dispose() {
    _nameCtl.dispose();
    _dobCtl.dispose();
    super.dispose();
  }

  Future<void> _pickDob(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 25)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      _dobCtl.text =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      setState(() {});
    }
  }

  void _onSave() {
    setState(() => _errorMessage = null);

    if (!_formKey.currentState!.validate()) return;

    if (_dobCtl.text.isEmpty) {
      setState(() => _errorMessage = "Date of birth is required");
      return;
    }

    print("Saved: ${_nameCtl.text} - ${_dobCtl.text} - $_gender");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Profile saved")));

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.pushReplacementNamed(context, '/lifestyle');
    });
  }

  Widget _genderOption({
    required String value,
    required String label,
    required double fontSize,
    required IconData icon,
  }) {
    bool selected = _gender == value;

    return InkWell(
      onTap: () => setState(() => _gender = value),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: fontSize - 1, color: const Color(0xFF64748B)),
            SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF475569),
              ),
            ),
            SizedBox(width: 5),
            if (selected)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF7C3AED),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // ----------- RESPONSIVE PARAMETERS (TIGHTENED FOR SMALL SCREENS) -----------
    final double cardWidth = width > 480 ? 430 : width * 0.90;

    double padding = width < 360 ? 10 : 18;
    double font14 = width < 360 ? 11 : 14;
    double font16 = width < 360 ? 14 : 16;

    double avatarRadius = width < 360 ? 18 : 22;
    double iconSize = width < 360 ? 20 : 26;
    double buttonHeight = width < 360 ? 40 : 46;

    double optionsPaddingRight = Responsive.isMobile ? 3 : 6;

    // ---------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: cardWidth,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// HEADER
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.person,
                          size: iconSize,
                          color:
                              Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Let's personalize your experience.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: font16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                    ],
                  ),
                ),

                /// WHITE CARD
                Container(
                  width: cardWidth,
                  padding: EdgeInsets.symmetric(
                    horizontal: padding,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  /// FORM
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// Full Name
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Full Name",
                            style: TextStyle(
                              fontSize: font14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          controller: _nameCtl,
                          decoration: const InputDecoration(
                            hintText: "Enter full name",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: (v) =>
                              v!.isEmpty ? "Name is required" : null,
                          style: TextStyle(fontSize: font14),
                        ),
                        SizedBox(height: 12),

                        /// DOB
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date Of Birth",
                            style: TextStyle(
                              fontSize: font14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        TextFormField(
                          controller: _dobCtl,
                          readOnly: true,
                          onTap: () => _pickDob(context),
                          decoration: InputDecoration(
                            hintText: "YYYY-MM-DD",
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              size: font14 + 2,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          validator: (_) =>
                              _dobCtl.text.isEmpty ? "Required" : null,
                          style: TextStyle(fontSize: font14),
                        ),
                        SizedBox(height: 12),

                        /// GENDER
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: font14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(height: 6),

                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: optionsPaddingRight,
                                ),
                                child: _genderOption(
                                  value: "male",
                                  label: "Male",
                                  fontSize: font14,
                                  icon: Icons.male,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                child: _genderOption(
                                  value: "female",
                                  label: "Female",
                                  fontSize: font14,
                                  icon: Icons.female,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: optionsPaddingRight,
                                ),
                                child: _genderOption(
                                  value: "other",
                                  label: "Other",
                                  fontSize: font14,
                                  icon: Icons.transgender,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 18),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: buttonHeight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C3AED),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _onSave,
                            child: Text(
                              "Save and Continue",
                              style: TextStyle(
                                fontSize: font16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 8),

                        MouseRegion(
                          cursor: SystemMouseCursors
                              .click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/lifestyle');
                            },
                            child: Text(
                              "Skip for now",
                              style: TextStyle(
                                fontSize: font14,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        if (_errorMessage != null) ...[
                          SizedBox(height: 8),
                          Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Text(
                  "You can update this later in your profile.",
                  style: TextStyle(
                    fontSize: font14 - 2,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}