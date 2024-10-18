// import '../set_initialize.dart';

// Future<bool> isAllowedEmail(String email) async {
//   final response = await SupabaseInitialize.supabase
//       .from('allowed_emails')
//       .select()
//       .eq('email', email);

//   final data = response as List;
//   return data.isNotEmpty;
// }

// Future<void> signInWithEmail(String email) async {
//   if (await isAllowedEmail(email)) {
//     final response = await SupabaseInitialize.supabase.auth.signInWithOtp(
//       email: email,
//     );
//   }
// }
