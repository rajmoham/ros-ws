// Generated by gencpp from file first_coursework/Command.msg
// DO NOT EDIT!


#ifndef FIRST_COURSEWORK_MESSAGE_COMMAND_H
#define FIRST_COURSEWORK_MESSAGE_COMMAND_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace first_coursework
{
template <class ContainerAllocator>
struct Command_
{
  typedef Command_<ContainerAllocator> Type;

  Command_()
    : command()
    , value(0)  {
    }
  Command_(const ContainerAllocator& _alloc)
    : command(_alloc)
    , value(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _command_type;
  _command_type command;

   typedef int32_t _value_type;
  _value_type value;





  typedef boost::shared_ptr< ::first_coursework::Command_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::first_coursework::Command_<ContainerAllocator> const> ConstPtr;

}; // struct Command_

typedef ::first_coursework::Command_<std::allocator<void> > Command;

typedef boost::shared_ptr< ::first_coursework::Command > CommandPtr;
typedef boost::shared_ptr< ::first_coursework::Command const> CommandConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::first_coursework::Command_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::first_coursework::Command_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::first_coursework::Command_<ContainerAllocator1> & lhs, const ::first_coursework::Command_<ContainerAllocator2> & rhs)
{
  return lhs.command == rhs.command &&
    lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::first_coursework::Command_<ContainerAllocator1> & lhs, const ::first_coursework::Command_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace first_coursework

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::first_coursework::Command_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::first_coursework::Command_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::first_coursework::Command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::first_coursework::Command_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::first_coursework::Command_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::first_coursework::Command_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::first_coursework::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d0fd248dabc91b444e51e6324afe70ff";
  }

  static const char* value(const ::first_coursework::Command_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd0fd248dabc91b44ULL;
  static const uint64_t static_value2 = 0x4e51e6324afe70ffULL;
};

template<class ContainerAllocator>
struct DataType< ::first_coursework::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "first_coursework/Command";
  }

  static const char* value(const ::first_coursework::Command_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::first_coursework::Command_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string command\n"
"int32 value\n"
;
  }

  static const char* value(const ::first_coursework::Command_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::first_coursework::Command_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.command);
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Command_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::first_coursework::Command_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::first_coursework::Command_<ContainerAllocator>& v)
  {
    s << indent << "command: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.command);
    s << indent << "value: ";
    Printer<int32_t>::stream(s, indent + "  ", v.value);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FIRST_COURSEWORK_MESSAGE_COMMAND_H
