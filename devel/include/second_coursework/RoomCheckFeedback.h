// Generated by gencpp from file second_coursework/RoomCheckFeedback.msg
// DO NOT EDIT!


#ifndef SECOND_COURSEWORK_MESSAGE_ROOMCHECKFEEDBACK_H
#define SECOND_COURSEWORK_MESSAGE_ROOMCHECKFEEDBACK_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace second_coursework
{
template <class ContainerAllocator>
struct RoomCheckFeedback_
{
  typedef RoomCheckFeedback_<ContainerAllocator> Type;

  RoomCheckFeedback_()
    : pos()
    , broken_rule(0)  {
    }
  RoomCheckFeedback_(const ContainerAllocator& _alloc)
    : pos(_alloc)
    , broken_rule(0)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _pos_type;
  _pos_type pos;

   typedef int32_t _broken_rule_type;
  _broken_rule_type broken_rule;





  typedef boost::shared_ptr< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct RoomCheckFeedback_

typedef ::second_coursework::RoomCheckFeedback_<std::allocator<void> > RoomCheckFeedback;

typedef boost::shared_ptr< ::second_coursework::RoomCheckFeedback > RoomCheckFeedbackPtr;
typedef boost::shared_ptr< ::second_coursework::RoomCheckFeedback const> RoomCheckFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::second_coursework::RoomCheckFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::second_coursework::RoomCheckFeedback_<ContainerAllocator1> & lhs, const ::second_coursework::RoomCheckFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.pos == rhs.pos &&
    lhs.broken_rule == rhs.broken_rule;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::second_coursework::RoomCheckFeedback_<ContainerAllocator1> & lhs, const ::second_coursework::RoomCheckFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace second_coursework

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e0794b652eb087be218547842a4c7c69";
  }

  static const char* value(const ::second_coursework::RoomCheckFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe0794b652eb087beULL;
  static const uint64_t static_value2 = 0x218547842a4c7c69ULL;
};

template<class ContainerAllocator>
struct DataType< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "second_coursework/RoomCheckFeedback";
  }

  static const char* value(const ::second_coursework::RoomCheckFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Define feedback\n"
"geometry_msgs/Point pos\n"
"int32 broken_rule\n"
"\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::second_coursework::RoomCheckFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pos);
      stream.next(m.broken_rule);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RoomCheckFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::second_coursework::RoomCheckFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::second_coursework::RoomCheckFeedback_<ContainerAllocator>& v)
  {
    s << indent << "pos: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.pos);
    s << indent << "broken_rule: ";
    Printer<int32_t>::stream(s, indent + "  ", v.broken_rule);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SECOND_COURSEWORK_MESSAGE_ROOMCHECKFEEDBACK_H
