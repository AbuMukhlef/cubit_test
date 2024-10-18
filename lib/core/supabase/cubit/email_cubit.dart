import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../set_initialize.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial());

  TextEditingController searchController = TextEditingController();

  Future<bool> isAllowedEmail({required String email}) async {
    print('isAllowedEmail');
    final response = await SupabaseInitialize.supabase
        .from('allowed_emails')
        .select()
        .eq('email', email);
    if (response.length.isOdd) {
      return false;
    }
    return true;
  }

  Future setData({required String email}) async {
    await SupabaseInitialize.supabase.from('allowed_emails').insert({
      'email': email,
    });
    print('setData');
  }

  Future removeData({required String email}) async {
    await SupabaseInitialize.supabase
        .from('allowed_emails')
        .delete()
        .eq('email', email);
    print('removeData');
  }


}
